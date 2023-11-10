from django.http import HttpRequest, HttpResponse
from django.shortcuts import render, HttpResponse, redirect,HttpResponseRedirect,get_object_or_404
from . decorators import login_required,superuser_required
from django.contrib import messages
from django.contrib import auth
from django.contrib.auth import authenticate
from . models import *
from account.models import User
from django.views import generic
from django.views import View
from .form import (ProductForm,
                   InventoryProductForm,
                   SalesForm,ExpensesForm,
                   ProductUnitForm,PaymentForm,
                   CustomerForm,SellerForm,
                   DailyTransactionForm,
                   DailyForm,
                   UserForm,
                   Product_EditForm

                )
from . cart import Cart
from django.http import JsonResponse
from datetime import datetime,timedelta
from django.utils import timezone
from django.db.models import Min,Max,Count
import nepali_datetime
from nepali_datetime import date
from django.db.models import Q
from django.contrib.auth.hashers import make_password
from account.models import User

def custom_404_view(request, exception):
    return render(request, 'app/error.html')


def custom_500_error_view(request, exception=None):
    return render(request, 'app/error.html')


def login(request):
    try:
        if request.user.is_authenticated:
            return redirect('app:index')

        if request.method =="POST":
            email = request.POST['useremail']
            print(email)
            password = request.POST['password']
            user_obj = User.objects.filter(email= email)
            print(user_obj)
            if not user_obj.exists():
                messages.warning(request,"Invalid username...")
                return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
                
            
            user_obj = authenticate(email=email, password=password)
            if user_obj:
                print("Authenticated...")
            else:
                print("Not Authenticated...")
            if user_obj and user_obj.is_superuser or user_obj.is_admin:
                auth.login(request, user_obj)
                return redirect('app:index')
            
            messages.warning(request,'Inavlid Password')
            return redirect('app:login')
            
        return render(request,'app/login.html')
            

    except Exception as e:
        print(e)
        messages.warning(request,'something wrong...')
        return redirect('app:login')


@login_required
def userlogout(request):
    auth.logout(request)
    messages.info(request,"logout successfully..")
    return redirect('app:login')

@login_required
def index(request):
    customers = Customer.objects.count()
    supplier = Seller.objects.count()
    toll = Toll.objects.all()
    transactions = Daily.objects.all()
    total  =0
    for item in transactions:
        total += item.total
    
    print("Total amount:", total)
    return render(request,'app/index.html',{'total_customers':customers,
                                            'supplier':supplier,
                                            'toll':toll,
                                            'total_amount':total
                                            })

@login_required
def toll(request):
    if request.method =="POST":
        action = request.POST['deleteToll']
        print(action)
        if action:
            id = request.POST['id']
            toll =Toll.objects.get(id = id)
            toll.delete()
            messages.info(request,'Toll Deleted Successfully !')
            return redirect('app:index')
        else:
            toll_name = request.POST['tollName']
            newtoll = Toll.objects.create(toll_name = toll_name)
            newtoll.save()
            messages.success(request,'New Toll Added Successfully !')
            return redirect('app:index')
    else:
        return redirect('app:index')


@login_required
def edit_toll(request, slug):
    if request.method == "POST":
        tollobj = Toll.objects.get(toll_slug=slug)
        tollobj.toll_name = request.POST['tollName']
        tollobj.save()
        messages.info(request,"Update Successfully !")
        return redirect('app:index')


@login_required
def toll_related(request, slug):
    tollname = Toll.objects.get(toll_slug = slug)
    toll_related_customers = Customer.objects.filter(toll= tollname)
    return render(request, 'app/customerList.html',{'customers':toll_related_customers,'toll_name':tollname})

@login_required
def customers(request):
    if request.method == "POST":
        name = request.POST['fullname']
        address = request.POST['address']
        email = request.POST['email']
        phoneNo = request.POST['phoneNo']
        form_type = request.POST['form_type']
        if form_type == "customer":
            toll = request.POST['toll']
            customer_toll = Toll.objects.get(id=toll)
            newCustomer = Customer.objects.create(name=name,
                                                address = address,
                                                phone_number = phoneNo,
                                                email = email,
                                                toll= customer_toll
                                                )
            newCustomer.save()
            messages.success(request,"New Customer Added Successfully !")
            customerlist = Customer.objects.all()
            sellers = Seller.objects.all()
            toll = Toll.objects.all()
            return render(request,'app/customers.html',{'customerlist':customerlist,
                                                        'sellers':sellers,
                                                        'toll':toll
                                                        })
        else:
            newseller =Seller.objects.create(name=name,
                                                address = address,
                                                phone_number = phoneNo,
                                                email = email
                                                )
            newseller.save()
            messages.success(request,"New Seller Added Successfully !")
            customerlist = Customer.objects.all()
            sellers = Seller.objects.all()
            toll = Toll.objects.all()
            return render(request,'app/customers.html',{'customerlist':customerlist,
                                                        'sellers':sellers,
                                                        'toll':toll
                                                        })

    else:
        sellers = Seller.objects.all()
        customerlist = Customer.objects.all()
        toll = Toll.objects.all()
        customerform = CustomerForm()
        sellerform =SellerForm()
        return render(request,'app/customers.html',{'customerlist':customerlist,
                                                    'sellers':sellers,
                                                    'toll':toll,
                                                    'customerform':customerform,
                                                    'sellerform':sellerform
                                                    })


@login_required
def updatecustomer(request):
    if request.method == "POST":
        id = request.POST['customerID']
        instance = Customer.objects.get(id= id)
        customerform = CustomerForm(request.POST, instance=instance)
        if customerform.is_valid():
            customerform.save()
            messages.success(request,"Update Successfully !")
            return redirect('app:customers')

        else:
            return HttpResponse(customerform.errors)



@login_required
@superuser_required
def customerdelet(request):
    if request.method =="POST":
        id = request.POST['customerid']
        customer = Customer.objects.get(id=id)
        try:
            customer.delete()
            messages.info(request,'Customer Deleted Successfully !')
            return redirect('app:customers')
        except ValidationError as e:
            messages.warning(request,e)
            return redirect('app:customers')
    else:
        return redirect('app:customers')

@login_required
def sellerupdate(request):
    if request.method == "POST":
        supplierId = request.POST['supplierid']
        supplier  = Seller.objects.get(id=supplierId)
        form  = SellerForm(request.POST, instance=supplier)
        if form.is_valid():
            form.save()
            messages.success(request, "Supplier Updated Successfully !")
            return redirect('app:customers')
        else:
            return HttpResponse(form.errors)
    else:
        return redirect('app:customers')


@superuser_required
def sellerdelete(request):
    if request.method =="POST":
        sellerId = request.POST['sellerid']
        obj = Seller.objects.get(id = sellerId)
        obj.delete()
        messages.info(request,"Supplier Deleted Successfully !")
        return redirect('app:customers')
    else:
        return redirect('app:customers')

class ProductViews(View):
    
    def get(self, request, *args, **kwargs):
        products = Product.objects.all()
        productUnt = ProductUnit.objects.all()
        form = ProductForm()
        productUnitForm= ProductUnitForm()
        return render(request, 'app/products.html', {'products': products,
                                                     'form':form,
                                                     'productUnitForm':productUnitForm,
                                                     'productUnits':productUnt
                                                     })
    
    def post(self, request, *args, **kwargs):
        id = kwargs.get('id')
        print(id)
        if id:
            try:
                instance = Product.objects.get(pk=id)
                print(instance)
                form = ProductForm(request.POST, request.FILES, instance=instance)
            except Product.DoesNotExist:
                messages.warning(request, 'Product not found.')
                return redirect('app:products')
        else:
            form = ProductForm(request.POST, request.FILES)

        if form.is_valid():
            form.save()
            if id:
                messages.success(request, 'Product edited successfully.')
            else:
                messages.success(request, 'Product added successfully.')
        else:
            messages.warning(request, 'Form is not valid. Please correct the errors.')

        return redirect('app:products')


@login_required
def productUnit(request):
    if request.method =="POST":
        form = ProductUnitForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request,"Unit Added Successfully !")
    return redirect('app:products')

@login_required
@superuser_required
def deleteProductUnit(request):
    if request.method =="POST":
        unitId = request.POST['product_unit_id']
        obj = ProductUnit.objects.get(id= unitId)
        obj.delete()
        messages.warning(request,"Unite deleted successfully !")
    return redirect('app:products')



@login_required
@superuser_required
def productDelete(request):
    if request.method == "POST":
        id = request.POST['id']
        product = Product.objects.get(id=id)
        product.delete()
        messages.warning(request,'Product Deleted Successfully !')
        return redirect('app:products')



class InventoryProductView(View):
    def get(self, request, *args, **kwargs):
        products = InventoryProduct.objects.all()
        form = InventoryProductForm()
        return render(request, 'app/inventoryProducts.html', {'products': products,
                                                     'form':form})
    
    def post(self, request, *args, **kwargs):
        id = kwargs.get('id')
        if id:
            try:
                instance = InventoryProduct.objects.get(pk=id)
                print(instance)
                form = InventoryProductForm(request.POST, instance=instance)
            except InventoryProduct.DoesNotExist:
                messages.warning(request, 'Product not found.')
                return redirect('app:inventoryproduct')
        else:
            form = InventoryProductForm(request.POST)

        if form.is_valid():
            form.save()
            if id:
                messages.success(request, 'Product edited successfully.')
            else:
                messages.success(request, 'New Product added successfully.')
        else:
            messages.warning(request, 'Form is not valid. Please correct the errors.')

        return redirect('app:inventoryproduct')

@login_required
def editeinventory(request, id):
    product = InventoryProduct.objects.get(id=id)
    instance = InventoryProduct.objects.get(pk=id)
    print(instance)
    form = InventoryProductForm(instance=instance)
    return render(request,'app/inventoryProductEdite.html', {'product': product,
                                                     'form':form})

@login_required
def delete_inventory(request):
    if request.method=="POST":
        id = request.POST['id']
        product= InventoryProduct.objects.get(id= id)
        product.delete()
        messages.info(request,'Deleted Successfully !')
        return redirect('app:inventoryproduct')
    else:
        return redirect('app:inventoryproduct')



class CustomerDetials(generic.DetailView):
    model = Customer
    template_name = 'app/shopping_cart.html'
    slug_field = 'name_slug'
    slug_url_kwarg = 'name_slug'
    
    def get_context_data(self, *args, **kwargs):
        context = super(CustomerDetials, self).get_context_data(*args, **kwargs)
        customer_id = self.kwargs['name_slug']
        customername = Customer.objects.get(name_slug =customer_id)
        salesid = Sales.objects.get(customer=customername.id)
        print(salesid.id)
        sales_item = SalesItem.objects.filter(id= salesid.id)
        if sales_item.exists():
            context['customerdetails'] = sales_item
        else:
            context['customerdetails'] = None 
            
        return context

import json
@login_required
def get_user(request):
    id = request.GET.get('user_id')
    user_details= Customer.objects.get(id=id)
    data ={
        'name': user_details.name,
        'address': user_details.address,
        'phone_number': user_details.phone_number,
        'email': user_details.email,
    }

    response_data = {
            'items': json.dumps(data)  # Convert user_details to a JSON string
        }
    return JsonResponse(response_data)


from django.db.models import Sum
from collections import Counter

@login_required
def salesdashboard(request):

    unique_dates = Sales.objects.values('nepali_create_date').annotate(count=Count('nepali_create_date')).distinct().order_by('-nepali_create_date')
   
    
    daily_sales = unique_dates

    total_amount = Sales.objects.all().aggregate(Sum('total_amount'))['total_amount__sum']
    

    daily_total = daily_sales.aggregate(Sum('total_amount'))['total_amount__sum'] or 0
    
    tolls = Toll.objects.all()
    return render(request,'app/sales_table.html',{'daily_sales':daily_sales,
                                                 'tolls':tolls
                                                })

@superuser_required
def deletesales(request):
    if request.method =="POST":
        id = request.POST['salesId']
        salesdate = request.POST['salesdate']
        sales_obj  = Sales.objects.get(id=id)
        sales_obj.delete()
        messages.info(request,"Sales Deleted Successfully !")
        return redirect('app:date_related_sales', salesdate)
    else:
        return redirect('app:sales_dashboard')


# testing sales dashboard
def sales_Dashboard(request):
    return render(request,'app/table.html')



# date related sales
def date_related_sales(request, date):
    sales = Sales.objects.filter(nepali_create_date= date)
    return render(request,'app/sales_details_table.html',{'sales':sales, 'date':date})


def toll_related_sales(request, slug):
    toll = Toll.objects.get(toll_slug=slug)
    customers = Customer.objects.filter(toll= toll)
    return render(request,'app/sales_toll.html',{'customers':customers,'toll':toll})


@login_required
def sales_item_list(request,id ):
    if request.method=="POST":
        sales_id_item = request.POST['id']
        status = request.POST['order_status']
        sales_item = Sales.objects.filter(id= sales_id_item)
        
        if status =='paid':
            for item in sales_item:
                item.payment_status = 'paid'
                item.remaining_amount=0
                item.paid_amount=item.get_total_cost()
                item.save()

    customers = Customer.objects.get(id=id)
    sales =Sales.objects.filter(customer= id).order_by('-payment_status')
   
    totalSales = 0
    remaning_amount =0
    paid_amount =0
    for item in  sales:
        for instance in item.sales_id.all():
            totalSales += instance.get_cost()
        remaning_amount += item.get_remaining_amount()
        paid_amount += item.total_pay_amount()
    lowest_date = customers.customer.filter(nepali_create_date__isnull=False).aggregate(Min('nepali_create_date'))['nepali_create_date__min']
    
    highest_date = customers.customer.filter(nepali_create_date__isnull=False).aggregate(Max('nepali_create_date'))['nepali_create_date__max']
    salesform = SalesForm()
    return render(request,'app/sales_list.html',{'saleItem':salesItem,
                                                 'customers':customers,
                                                 'sales':sales,
                                                 'remaning_amount':remaning_amount,
                                                 'total_pay':paid_amount,
                                                 'totalamount':totalSales,
                                                 'lowest_date':lowest_date,
                                                 'heighest_date':highest_date,
                                                 'salesform':salesform
                                                 })

@login_required
def salesItem(request):
    instances = Sales.objects.all()
    total_amounts = sum(sale.caulculate_total_amount() for sale in instances)
    total_paid  = sum(sale.get_remaining_amount() for sale in instances)
    print(total_paid)
    expenses_form  = ExpensesForm()
    expenses = Expenses.objects.all()
    purchase = Purchase.objects.all()
    total_purchase = sum(item.get_total_cost() for item in purchase)
    total_expenses=sum(exp.get_cost() for exp in expenses)
    return render(request, 'app/salesitem.html',{'sales_items':instances[:15], 
                                                 'totalSales':total_paid,
                                                 'expenses_form':expenses_form,
                                                 'expenses':expenses,
                                                 'purchase':purchase,
                                                 'total_purchase':total_purchase,
                                                 'total_expense':total_expenses
                                                 })

@login_required
@superuser_required
def delete_sales(request):
    if request.method=="POST":
        id = request.POST['salesId']
        print(id)
        sales = Sales.objects.get(id=id)
        sales.delete()
        messages.success(request,'Sales Deleted Successfull !')
        return redirect('app:salesItem')
    else:
        return redirect('app:salesItem')

@login_required
def add_edite_sales(request, id=None, customerId=None):
    customerdetails= None
    if customerId:
        customerdetails = Customer.objects.get(id= customerId)
    instance = None
    try:
        if id:
            instance = Sales.objects.get(pk=id)
    except Exception as e:
        messages.warning(request, 'An error occurred while retrieving the Sales Item.')
        return redirect('app:salesItem')
    
    cart = Cart(request)
    products = cart.List()
    
    if request.method == 'POST':
        form = SalesForm(request.POST, instance=instance)
        if form.is_valid():
            customer_id = form.cleaned_data.get('customer').id
            # Check if a sales record for the customer and current date exists
            existing_sales_record = Sales.objects.filter(
                customer_id=customer_id,
                nepali_create_date=nepali_datetime.date.today().strftime("%d-%B-%Y"),payment_status="unpaid"
            ).first()

            if existing_sales_record:
                instance_data = form.save(commit=False)
                instance_data.id = existing_sales_record.id  # Use the existing sales ID
                instance_data.save()

            else:
                instance_data = form.save()
                sales_id = instance_data.id

            payment = request.POST['payment_status']
            total_price =0

            for item in products:
                item_id= item['id']
                price = request.POST.get(f'price{item_id}')
                productid = request.POST.get(f'id{item_id}')
                product = Product.objects.get(id=productid)
                quantity = request.POST.get(f'quantity{item_id}')
                unite_id = request.POST.get(f'unite{item_id}')
                unite = ProductUnit.objects.get(id=unite_id)
                total_price += float(price)
                salesItem = SalesItem.objects.create(sales_id=instance_data,
                                                     product=product,
                                                     price= price,
                                                     quantity=quantity,
                                                     unit=unite
                                                     )
                salesItem.save()
                cart.remove(product)
                
            
            if payment == 'paid':
                instance_data.payment_status= payment
                instance_data.total_amount =total_price
                instance_data.paid_amount =total_price
                instance_data.save()
            elif payment =='partially_paid':
                instance_data.payment_status= payment
                partially_paid_amount= request.POST['partially_paid_amount']
                instance_data.total_amount =price
                instance_data.remaining_amount = instance_data.caulculate_total_amount()
                instance_data.paid_amount = partially_paid_amount
                instance_data.save()
                
            else:
                instance_data.payment_status= payment
                # instance_data.total_amount =total_price
                # instance_data.remaining_amount =total_price
                instance_data.save()
                print("unpaid")

            if instance:  # Edit operation
                messages.success(request, 'Sale Item edited successfully.')
                return redirect('app:salesItem', id=instance.id)  # Redirect to the edited SubCategories's details page
            else:  # Add operation
                messages.success(request, 'Sales added successfully.')
                return redirect('app:salesItem')  # Redirect to the page for adding new SubCategoriess
        else:
            messages.warning(request, 'Form is not valid. Please correct the errors.')
         
    else:
        form = SalesForm(instance=instance)
    paymentform = PaymentForm()
    cart =Cart(request)
    data = cart.List()
    units =ProductUnit.objects.all()
    products = Product.objects.all()
    context = {'form': form,'products':products,'cartItems':data, 'units':units,'instance': instance,'paymentform':paymentform,'customerdetails':customerdetails}
    return render(request, 'app/sales_item_add.html', context)




#payment 
@login_required
def payment(request):
    if request.method =="POST":
        form  = SalesForm(request.POST)
        if form.is_valid():
            id = form.cleaned_data['customer'].id
            instance = form.save(commit=False)
            instance.payment_status="partially_paid"
            customer = Customer.objects.get(id= id)
            
            instance.save()
            return redirect('app:salesList',id)
        else:
            print(form.errors)
            return HttpResponse(form.errors)
    


@login_required
def add_to_cart(request):
    id = request.POST.get('product_id')
    cart = Cart(request)
    customerid = request.POST['customerId']
    print("customerid:",customerid)
    if id:
        quantity = 1
        product = Product.objects.get(id=id)
        cart.add(product, quantity)
    cart.clear()
    data = cart.List()
    response_data = {'message': f'Added product {id} to the cart.','items':f'{data}'}
    
    # return JsonResponse(response_data)
    # unites = ProductUnit.objects.all()
    # return render(request,'app/product_table.html',{'products':data,'unites':unites})
    if customerid:
        return redirect('app:add_inner_sales',int(customerid))
    else:
        return redirect('app:addsales')


@login_required
def delete_cart_item(request):
    id = request.POST.get('id')
    customerid = request.POST['customerId']
    product = Product.objects.get(id=id)
    cart = Cart(request)
    cart.remove(product)
    # response_data = {'message': f'Added product {id} to the cart.'}
    
    # return JsonResponse(response_data)
    if customerid:
        return redirect('app:add_inner_sales',int(customerid))
    else:
        return redirect('app:addsales')

from .form import PurchaseItem, PurchaseItemFormSet,PurchaseForm,ProductForm,PurchaseItemForm

@login_required
def addpurchase(request):
    purchase_form = PurchaseForm(request.POST)
    purchase_item_form = PurchaseItemForm(request.POST)
    if purchase_form.is_valid() and purchase_item_form.is_valid():
        party = purchase_form.cleaned_data['party']
        existing_purchase = Purchase.objects.filter(party=party).first()
        
        if existing_purchase:
            purchase_item = purchase_item_form.save(commit=False)
            purchase_item.purchaseId = existing_purchase
            purchase_item.save()
            messages.success(request, 'Purchase item added successfully!')
        else:
            purchase_instance = purchase_form.save()
            purchase_item = purchase_item_form.save(commit=False)
            purchase_item.purchaseId = purchase_instance
            purchase_item.save()
            messages.success(request, 'New purchase and item added successfully!')
    
    purchase = PurchaseForm()
    purchaseItem = PurchaseItemForm()
    data = Purchase.objects.all()
    return render(request,'app/add_purchase.html',{'pruchaseform':purchase,
                                                   'purchaseItem':purchaseItem,
                                                   'purchase_data':data
                                                   })             


@login_required
@superuser_required
def deletePurchase(request):
    if request.method == "POST":
        id = request.POST['purchaseID']
        purchase_obj = Purchase.objects.get(id=id)
        purchase_obj.delete()
        return redirect('app:salesItem')
    else:
        return redirect('app:salesItem')


# def addpurchase(request,id=None):
#     purchase_id=None

#     if id:
#         purchase_id = Purchase.objects.get(id=id)

#     if request.method =="POST":
#         purchase = PurchaseForm(request.POST, instance=purchase_id)
#         purchase_item_formset = PurchaseItemFormSet(request.POST, instance=purchase_id)
#         if purchase.is_valid() and purchase_item_formset.is_valid():
#             purchase.save()
#             purchase_item_formset.save()
#     else:
#         purchase = PurchaseForm(instance=purchase_id)
#         purchase_item_formset = PurchaseItemFormSet(instance=purchase_id)

#     return render(request,'app/add_purchase.html',{'pruchaseform':purchase,
#                                                    'purchase_item_formset':purchase_item_formset
#                                                    })

    # if request.method == 'POST':
    #     purchase_form = PurchaseForm(request.POST)
    #     purchase_item_formset = PurchaseItemFormSet(request.POST, prefix='purchaseitem_set')
    #     if purchase_form.is_valid() and purchase_item_formset.is_valid():
    #         purchase = purchase_form.save()
    #         purchase_item_formset.instance = purchase
    #         purchase_item_formset.save()
    #         return HttpResponse("<h1>Successfully Added !</h1>")  # Replace with your success URL

    # else:
    #     purchase_form = PurchaseForm()
    #     purchase_item_formset = PurchaseItemFormSet(prefix='purchaseitem_set')

    # return render(request, 'app/add_purchase.html', {
    #     'purchase_form': purchase_form,
    #     'purchase_item_formset': purchase_item_formset,
    # })




from django.forms import inlineformset_factory
@login_required
def createpurchase(request):
    form = PurchaseForm()
    InlineForm = inlineformset_factory(Purchase, PurchaseItem, 
		fields=('product', 'unit','amount_per_unit','quantity',), exclude=('pk',), can_delete=False,
	)
    if request.method == 'POST':
        form = PurchaseForm(request.POST)
        formset = InlineForm(request.POST)
    context = {
		'form': form,
		'inline_form': InlineForm()
	}
    return render(request,'app/createpurchase.html', context)


@login_required
def purchaseDetails(request, id):
    purchaseId = Purchase.objects.get(id=id)
    purchaseItems = purchaseId.purchase.all()
    total_purchase = sum(item.get_cost() for item in purchaseItems)
    return render(request,'app/purchaseDetails.html',{'purchaseItems':purchaseItems,
                                                      'purchaseID':purchaseId,
                                                      'total_purchase':total_purchase})


@login_required
def expenses(request):
    if request.method =="POST":
        form = ExpensesForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('app:salesItem')
    return redirect('app:salesItem')

@login_required
@superuser_required
def deleteexpense(request):
    if request.method =="POST":
        id = request.POST['expensesID']
        expense_obj = Expenses.objects.get(id= id)
        expense_obj.delete()
    return redirect('app:salesItem')


@login_required
def addProductUnit(request):
    return render(request,'app/productUnit.html')



nepali_month_mapping = {
    'Baishakh': 1,
    'Jestha': 2,
    'Ashadh': 3,
    'Shrawan': 4,
    'Bhadra': 5,
    'Ashwin': 6,
    'Kartik': 7,
    'Mangsir': 8,
    'Poush': 9,
    'Magh': 10,
    'Falgun': 11,
    'Chaitra': 12,
}

@login_required
def dailytransaction(request, id=None):
    instance= None
    formatted_date= None
    data=None
    if id:
        instance = Daily.objects.get(id=id)
        data = DailyTransaction.objects.select_related('dailyid').filter(dailyid=instance).all()

        create_date = Daily.objects.get(id = instance.id)
        nepali_date_str = create_date.nepali_date
        day, month_name, year = nepali_date_str.split('-')

        nepali_month = nepali_month_mapping.get(month_name)

        if nepali_month is not None:
            nepali_date = date(int(year), nepali_month, int(day))
            formatted_date = nepali_date.strftime('%Y-%m-%d')
        else:
            print("Invalid Nepali month name")


    if request.method == "POST":
        today  = request.POST['nepali_date']
        year, month, day = map(int, today.split('-'))
        nepali_date = date(year, month, day)
        today = nepali_date.strftime("%d-%B-%Y")
        daily = Daily.objects.filter(nepali_date = today).first()
        total = request.POST['total']
        if daily is None:
            dailyobj = Daily.objects.create(nepali_date=today, total=total)
            dailyobj.save()
            dailyobj  = Daily.objects.get(id=dailyobj.id)
            
        else:
            daily.total+=(float(total))
            daily.save()

        
        form = DailyTransactionForm(request.POST, instance=instance)
        
        if form.is_valid():
            instacne_data= form.save(commit=False)
            if daily:
                instacne_data.dailyid = daily
            else:
                instacne_data.dailyid = dailyobj

           
            # instacne_data.save()

            additional_fields = {}


            for key, value in request.POST.items():
                if key.startswith(('product', 'quantity', 'unite', 'remarks')):
                    field_type, *rest = key.split('_')
                    index = rest[0] if rest else '0'
                    additional_fields.setdefault(int(index), {})[field_type] = value

                            
            print(additional_fields)
            
            try:
                for index, fields in additional_fields.items():
                    print("aAA:", fields)

                    daily_instance = instacne_data.dailyid  
                    fields['dailyid'] = daily_instance

                    product_id = fields['product']
                    product_instance = Product.objects.get(id=product_id)  
                    fields['product'] = product_instance

                    unite_id = fields['unite']
                    unite_instance = ProductUnit.objects.get(id=unite_id)  
                    fields['unite'] = unite_instance
                    
                    DailyTransaction.objects.create(**fields)

            except Exception as e:
                print(e)
                return redirect('app:daily_transaction')
            if instance:
                messages.success(request,"Transaction Update Successfully !")
                return redirect('app:update_trasancation', instance.id)
            else:
                messages.success(request,"Transaction Added Successfully !")
                return redirect('app:daily_transaction')
            
        else:
            print(form.errors)
            messages.warning(request,"Please fill out the all form fields !")
            return redirect('app:daily_transaction')
    else:
        dailytrasactions_list = Daily.objects.all()
        data = DailyTransaction.objects.all()
        daily_form  = DailyTransactionForm(instance=instance)
        product = Product.objects.all()
        unites = ProductUnit.objects.all()
        nepalidate = nepali_datetime.date.today()
        form = DailyForm()
        return render(request,'app/create_dailytransaction.html',{'daily_form':daily_form,
                                                           'dailytrasactions_list':dailytrasactions_list,
                                                           'products':product,
                                                           'unites':unites,
                                                            'data':data,
                                                            'instance':instance,
                                                            'date':formatted_date,
                                                            'nepalidate':nepalidate,
                                                            'form':form,
                                                            'data':data
                                                           })


@login_required
def edite_dailytransaction(request, id= None):
    formatted_date= None
    instance=Daily.objects.get(id=id)
    selectdata =DailyTransaction.objects.select_related('dailyid').filter(dailyid=instance).all()

    nepali_date_str = instance.nepali_date
    day, month_name, year = nepali_date_str.split('-')

    nepali_month = nepali_month_mapping.get(month_name)

    if nepali_month is not None:
        nepali_date = date(int(year), nepali_month, int(day))
        formatted_date = nepali_date.strftime('%Y-%m-%d')
    else:
        print("Invalid Nepali month name")
    # formatted_date=instance.nepali_date
    
    if request.method == "POST":
        instance = Daily.objects.get(id=id)
        
        form = DailyForm(request.POST, instance=instance)
        daily_instance=form.save(commit=False)
        today  = request.POST['nepali_date']
        year, month, day = map(int, today.split('-'))
        nepali_date = date(year, month, day)
        today = nepali_date.strftime("%d-%B-%Y")
        daily_instance.nepali_date = today
        daily_instance.save()
        # Handling form data
        transaction_ids = request.POST.getlist('transaction_id')

        for transaction_id in transaction_ids:
            product_id = request.POST.get(f'product_{transaction_id}')
            quantity = request.POST.get(f'quantity_{transaction_id}')
            unite_id = request.POST.get(f'unite_{transaction_id}')
            remarks = request.POST.get(f'remarks_{transaction_id}')
            daily_transaction = DailyTransaction.objects.get(id=transaction_id)

            daily_transaction.product_id = product_id
            daily_transaction.quantity = quantity
            daily_transaction.unite_id = unite_id
            daily_transaction.remarks = remarks
            daily_transaction.save()

        messages.success(request,"Transaction Update Successfully !")
        return redirect('app:update_trasancation', instance.id)
    else:
        data = DailyTransaction.objects.all()
        daily_form  = DailyTransactionForm(instance=instance)
        product = Product.objects.all()
        unites = ProductUnit.objects.all()
        nepalidate = nepali_datetime.date.today()
        form = DailyForm()
        return render(request,'app/edite_daily_transaction.html',{'daily_form':daily_form,
                                                           'products':product,
                                                           'unites':unites,
                                                            'data':data,
                                                            'instance':instance,
                                                            'date':formatted_date,
                                                            'nepalidate':nepalidate,
                                                            'form':form,
                                                            'selectdata':selectdata
                                                           })



def delete_daily_transaction(request):
    if request.method=="POST":
        id = request.POST['daily_transactionID']
        transaction_obje = Daily.objects.get(id= id)
        transaction_obje.delete()
        messages.info(request,"Deleted Successfully !")
        return redirect('app:daily')
    else:
        return redirect('app:daily')


@login_required
def daily(request):
    dailytrasactions_list = Daily.objects.all()
    data = DailyTransaction.objects.all()
    daily_form  = DailyTransactionForm()
    product = Product.objects.all()
    unites = ProductUnit.objects.all()
    today  = nepali_datetime.date.today()
    enddate=today + timedelta(days=1)
    return render(request,'app/dailytransaction.html',{'daily_form':daily_form,
                                                           'dailytrasactions_list':dailytrasactions_list,
                                                           'products':product,
                                                           'unites':unites,
                                                            'data':data,
                                                            'today':today,
                                                            'enddate':enddate})

# daily transaction filter on the basis of date

@login_required
def dailytrasactionfilter(request):
    today  = nepali_datetime.date.today()
    enddate=today + timedelta(days=1)
    if request.method =="POST":
        startdate = request.POST['startdate']
        enddate = request.POST['enddate']
        year, month, day = map(int, startdate.split('-'))
        nepali_date = date(year, month, day)
        start_date = nepali_date.strftime("%d-%B-%Y")

        year, month, day = map(int, enddate.split('-'))
        nepali_date = date(year, month, day)
        end_date = nepali_date.strftime("%d-%B-%Y")

        if start_date <= end_date:
            dailyobjlist = Daily.objects.filter(Q(nepali_date__range=(start_date, end_date)))
            return render(request,'app/table.html',{'daily_list':dailyobjlist,'startdate':today,
                                                'enddate':enddate})
        else:
            dailyobjlist= Daily.objects.all()
            messages.warning(request,'Start date cannot be greater than the end date.')
            return render(request,'app/table.html',{'daily_list':dailyobjlist,'startdate':today,
                                                'enddate':enddate})
        
    else:
        dailyobjlist= Daily.objects.all()
        return render(request,'app/table.html',{'daily_list':dailyobjlist,
                                                'startdate':today,
                                                'enddate':enddate
                                                })

@login_required
@superuser_required
def delete_transaction(request):
    if request.method=="POST":
        id = request.POST['transactionID']
        daily_id = request.POST['daily_id']
        transaction_obje = DailyTransaction.objects.get(id= id)
        transaction_obje.delete()
        messages.info(request,"Deleted Successfully !")
        return redirect('app:update_trasancation', daily_id)
    else:
        return redirect('app:daily')

from django.contrib.auth.models import Group
#user 
@login_required
@superuser_required
def user_add_edite(request):
    userform  = UserForm()
    if request.method =="POST":
        form  = UserForm(request.POST)
        if form.is_valid():
            instance = form.save(commit=False)
            instance.password = make_password(form.cleaned_data['password'])
            instance.password2 = make_password(form.cleaned_data['password2'])
            instance.is_admin= True
            instance.save() 
            group = Group.objects.get(name='User')
            instance.groups.add(group)
            messages.success(request,"New User Created Successfully !")
            return redirect('app:user')
        else:
            for field, error_list in form.errors.items():
                for error in error_list:
                    messages.warning(request, f"{field}: {error}")
            return redirect('app:user')
    else:
        userlist = User.objects.all()
        return render(request,'app/user.html',{'userform':userform,'userlist':userlist})
    
@login_required
@superuser_required
def deleteUser(request):
    if request.method == "POST":
        userid = request.POST['userID']
        userinstance = User.objects.get(id= userid)
        userinstance.delete()
        messages.info(request,"User deleted Successfully !")
        return redirect('app:user')
    else:
        return redirect('app:user')
    



def report_daily_tranjection(request):
    sales = Product.objects.all()
    mon = Daily.objects.all()
   
    context = {
        'sales': sales,
        'daily_cash': mon,
    }

    return render(request, 'report.html',context)




def edits_sales(request, id):
    print(id)
    # clid = Sales.objects.filter(customer_id=id)
    sales = SalesItem.objects.get(sales_id=id)
    edit_salesForm = Product_EditForm(instance=sales)
    if request.method == 'POST':
        form = Product_EditForm(request.POST, instance=sales)
        if form.is_valid():
            form.save()
            return redirect('salesItem', id=id)
        else:
            return redirect('sale_edits', id=id)
    
    context = {
        'sales': sales,
        'edit_salesForm':edit_salesForm,
    }

    

    return render(request,'app/edit_sales.html', context)

def save_edit_sales(request):
    if request.method == 'POST':
        form = Product_EditForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/')
        else:
            return redirect('sale_edits')
