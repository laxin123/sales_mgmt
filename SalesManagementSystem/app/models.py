from django.db import models
from autoslug.fields import AutoSlugField
import datetime
import nepali_datetime
from django.db.models.signals import pre_delete
from django.dispatch import receiver
from django.core.exceptions import ValidationError


class Toll(models.Model):
    toll_name = models.CharField(max_length=150)
    toll_slug = AutoSlugField(populate_from ='toll_name', default=None, unique=True)

    class Meta:
        ordering =['id']

    def __str__(self):
        return self.toll_name


    def get_total_paid_amount(self):
        total_paid_amount = 0.0
        customers = Customer.objects.filter(toll=self)
        
        for customer in customers:
            sales = Sales.objects.filter(customer=customer)
            
            for sale in sales:
                total_paid_amount += sale.total_pay_amount()
        
        return total_paid_amount

    def get_total_remaining_amount(self):
        total_remaining_amount = 0.0
        customers = Customer.objects.filter(toll=self)
        
        for customer in customers:
            sales = Sales.objects.filter(customer=customer)
            
            for sale in sales:
                total_remaining_amount += sale.get_remaining_amount()
        
        return total_remaining_amount

    def get_total_amount(self):
        total_paid_amount = self.get_total_paid_amount()
        total_remaining_amount = self.get_total_remaining_amount()
        total_amount = total_paid_amount + total_remaining_amount
        return total_amount

class Customer(models.Model):
    name = models.CharField(max_length=150)
    toll = models.ForeignKey(Toll, on_delete=models.CASCADE, related_name='customer_toll', null=Toll, blank=True)
    address =models.CharField(max_length=150, null=True, blank=True)
    phone_number = models.CharField(max_length=20,null=True, blank=True)
    email = models.CharField(max_length=150, null=True, blank=True)
    name_slug = AutoSlugField(populate_from='name', unique=True)
    added_date = models.DateField(auto_now=True)
    nepali_added_date = models.CharField(max_length=200,default=nepali_datetime.date.today().strftime("%d-%B-%Y"), null=True, blank=True)

    class Meta:
        ordering =['-id',]

    def __str__(self):
        return self.name


    def get_total_remaining_amount(self):
        total_remaining_amount = 0.0
        related_sales = self.customer.all()  # Get related sales records for this customer
        
        for sale in related_sales:
            total_remaining_amount += sale.get_remaining_amount()
        
        return total_remaining_amount

    def get_total_paid_amount(self):
        total_paid_amount = 0.0
        related_sales = self.customer.all()  # Get related sales records for this customer
        
        for sale in related_sales:
            total_paid_amount += sale.total_pay_amount()
        
        return total_paid_amount
    
    def total_amount(self):
        totalamount = 0.0
        related_sales = self.customer.all()  # Get related sales records for this customer
        
        for sale in related_sales:
            totalamount += sale.get_total_cost()
        
        return totalamount



@receiver(pre_delete, sender=Customer)
def prevent_delete_customer_with_sales(sender, instance, **kwargs):
    if instance.customer.exists():
        raise ValidationError("This customer is related to sales. You cannot delete it.")

class Seller(models.Model):
    name = models.CharField(max_length=150)
    address =models.CharField(max_length=150, null=True, blank=True)
    phone_number = models.CharField(max_length=20)
    email = models.CharField(max_length=150, null=True, blank=True)

    class Meta:
        ordering =['-id',]

    def __str__(self):
        return self.name
    
class ProductUnit(models.Model):
    unit_name = models.CharField(max_length=150)

    def __str__(self):
        return self.unit_name


class Product(models.Model):
    product_name = models.CharField(max_length=150)
    image = models.ImageField(upload_to='productimage/', null=True, blank=True)
    qty = models.FloatField(null=True, default=0)

    
    def product_qty(self):
        totalQty = 0.0
        related_qty = self.daily_product.filter(product=self).aggregate(total=Sum('quantity'))  # Get related daily_tranjection records for this customer
        print('hello',related_qty)

        return related_qty






        # tranjection = DailyTransaction.objects.filter(product=self).aggregate(total=Sum('quantity'))
        # print('hello',tranjection)

        # return tranjection
    class Meta:
        ordering =['id']
    
    def __str__(self):
        return self.product_name

class InventoryProduct(models.Model):
    product_name = models.ForeignKey(Product, on_delete= models.CASCADE, related_name='related_product')
    rate_retail = models.FloatField(null=True, blank=True)
    rate_wholesale = models.FloatField()
    rate_manu= models.FloatField(null=True, blank=True)
    created_date = models.DateField(auto_now=True)
    nepali_create_date = models.CharField(max_length=200,default=nepali_datetime.date.today().strftime("%d %B %Y"))
    modified_date = models.DateField(null=True, blank=True)
    deleted_date = models.DateField(null=True, blank=True)


    class Meta:
        ordering =['-id',]
    
    def __str__(self):
        return str(self.product_name)
    

class PurchaseParty(models.Model):
    name = models.CharField(max_length=150)
    pan_no = models.PositiveIntegerField(null=True, blank=True)
    address =models.CharField(max_length=150, null=True, blank=True)
    contact_no = models.PositiveIntegerField(null=True, blank=True)
    created_date = models.DateTimeField(auto_now=True)    
    nepali_create_date = models.CharField(max_length=200,default=nepali_datetime.date.today().strftime("%d %B %Y"))
    modified_date = models.DateTimeField(null=True, blank=True)
    deleted_date = models.DateTimeField(null=True, blank=True)

    class Meta:
        ordering =['-id']

    def __str__(self):
        return self.name
    
from django.db.models.signals import pre_save,pre_delete
from django.dispatch import receiver
from django.db.models import Sum
from django.db.models import F

class Purchase(models.Model):
    party = models.ForeignKey(Seller,on_delete=models.CASCADE, related_name='purchaseparty')
    total_amount =models.FloatField(null=True, blank=True)
    bill_no = models.PositiveIntegerField(null=True, blank=True)
    created_date = models.DateTimeField(auto_now=True)
    nepali_create_date = models.CharField(max_length=200,default=nepali_datetime.date.today().strftime("%d-%B-%Y"),editable=False, null=True, blank=True) #widget=models.HiddenInput()

    class Meta:
        ordering =['-id']
    
    def __str__(self):
        return str(self.party) + " "  +str(self.total_amount)
    

    def get_total_cost(self):
        return sum([item.get_cost() for item in self.purchase.all()])


class PurchaseItem(models.Model):
    purchaseId = models.ForeignKey(Purchase, on_delete=models.CASCADE, related_name='purchase')
    product = models.ForeignKey(Product, on_delete= models.CASCADE, related_name='prod')
    unit = models.ForeignKey(ProductUnit, on_delete=models.DO_NOTHING, related_name='product_unit')
    amount_per_unit = models.PositiveBigIntegerField()
    quantity =models.FloatField()
    created_date = models.DateTimeField(auto_now=True)
    nepali_create_date = models.CharField(max_length=200,default=nepali_datetime.date.today().strftime("%d-%B-%Y"),editable=False, null=True, blank=True) #widget=models.HiddenInput()

    
    class Meta:
        ordering =['-id']

    def __str__(self):
        return str(self.product)
    
    def get_cost(self):
        return self.amount_per_unit * self.quantity
    

   
    
    


@receiver(pre_save, sender=PurchaseItem)
def add_total(sender, instance, **kwargs):
    total_amount = PurchaseItem.objects.filter(purchaseId=instance.purchaseId).aggregate(total=Sum(F('amount_per_unit') * F('quantity')))['total']
    instance.purchaseId.total_amount = total_amount
    instance.purchaseId.save()



# sales models
class Sales(models.Model):
    payment_method =(('paid','Paid'),
                     ('partially_paid','Partially Paid'),
                     ('unpaid','Unpaid'))
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, related_name='customer')
    bill_no  = models.IntegerField(null=True, blank=True)
    phone_number = models.CharField(max_length=20)
    address = models.CharField(max_length=150)
    email = models.EmailField(null=True, blank=True)
    payment_status= models.CharField(choices=payment_method, max_length=150,null= True, blank=True)
    total_amount = models.IntegerField(default=0,null=True, blank=True)
    remaining_amount = models.IntegerField(default=0, null= True, blank=True)
    paid_amount = models.IntegerField(default=0, null=True, blank=True)
    nepali_create_date = models.CharField(max_length=200,default=nepali_datetime.date.today().strftime("%d-%B-%Y"), null=True, blank=True) #widget=models.HiddenInput(),,editable=False
    created_date = models.DateField(auto_now_add=True)
    modified_date = models.DateField(auto_now=True)
    deleted_date = models.DateField(null=True, blank=True)
    remarks = models.TextField(null = True, blank= True)
    class Meta:
        ordering = ['-id',]

    def __str__(self):
        return str(self.customer)

    def get_total_cost(self):
        return sum([item.get_cost() for item in self.sales_id.all()])
    
    def get_remaining_amount(self):
        if self.paid_amount is None:
            amount = 0
        else:
            amount = self.paid_amount
        remaining = self.get_total_cost() - amount
        return remaining
    
    def total_pay_amount(self):
        totalpaid = self.get_total_cost() - self.get_remaining_amount()
        return totalpaid
    
    def caulculate_total_amount(self):
        if self.payment_status == 'partially_paid':
            if self.paid_amount is not None:
                self.total_amount = self.get_total_cost()
                self.remaining_amount = self.get_total_cost() - self.paid_amount
                self.save()
                return self.total_amount
        else:
            self.total_amount = self.get_total_cost()
            return self.total_amount
    
    def get_unique_nepali_dates():
        return Sales.objects.values_list('nepali_create_date', flat=True).distinct()

class SalesItem(models.Model):
    sales_id = models.ForeignKey(Sales, on_delete= models.CASCADE, related_name='sales_id')
    product = models.ForeignKey(Product, on_delete= models.CASCADE, related_name='sales_product')
    price = models.PositiveIntegerField()
    quantity = models.FloatField()
    unit = models.ForeignKey(ProductUnit, on_delete=models.CASCADE, related_name='productunit')
    nepali_create_date = models.CharField(max_length=200,default=nepali_datetime.date.today().strftime("%d-%B-%Y"))
    created_date = models.DateField(auto_now=True)
    modified_date = models.DateField(null=True, blank=True)
    deleted_date = models.DateField(null=True, blank=True)
    

    class Meta:
        ordering =['-id']

    def get_cost(self):
        return self.price

@receiver(pre_save, sender=SalesItem)
def totalamount(sender, instance, **kwargs):
    total_amount = SalesItem.objects.filter(sales_id=instance.sales_id).aggregate(total=Sum(F('price')))['total']
    instance.sales_id.total_amount = total_amount
    instance.sales_id.remaining_amount =total_amount
    instance.sales_id.save()

class Payment(models.Model):
    saleId = models.ForeignKey(Sales, on_delete=models.CASCADE, related_name ='salesid', null=True, blank=True)
    customer = models.ForeignKey(Customer, on_delete= models.CASCADE, related_name='pay_customer')
    amount = models.FloatField()
    remarks = models.TextField()
    def __str__(self):
        return str(self.amount)
    
class Expenses(models.Model):
    create_date = models.DateField(auto_now=True)
    nepali_create_date = models.CharField(max_length=200,default=nepali_datetime.date.today().strftime("%d %B %Y"))
    expenses_name = models.CharField(max_length=150)
    amount = models.FloatField()


    class Meta:
        ordering =['-id',]

    def __str__(self):
        return self.expenses_name
    

    def get_cost(self):
        return self.amount


class Daily(models.Model):
    nepali_date =  models.CharField(max_length=200)
    total = models.IntegerField(null=True, blank=True)

    class Meta:
        ordering =['-nepali_date',]

    def __str__(self):
        return str(self.nepali_date)
    
    
class DailyTransaction(models.Model):
    dailyid = models.ForeignKey(Daily, on_delete=models.CASCADE, related_name='dailyId', null=True, blank=True)
    product = models.ForeignKey(Product,on_delete=models.DO_NOTHING, db_constraint=False, related_name='daily_product')
    quantity = models.FloatField()
    unite = models.ForeignKey(ProductUnit, on_delete=models.DO_NOTHING, db_constraint=False, related_name='daily_product_unit', null=True, blank=True)
    
    remarks = models.TextField()


    class Meta:
        ordering= ['-dailyid']

    def __str__(self):
        return str(self.product)
    

    def get_amount(self):
        return self.dailyid

    

# @receiver(pre_save, sender=DailyTransaction)
# def add_total(sender, instance, **kwargs):
#     total_amount = DailyTransaction.objects.filter(dailyid=instance.dailyid).exclude(id=instance.id).aggregate(total=Sum('total_amount'))['total']
#     instance.dailyid.total = total_amount
#     instance.dailyid.save()

