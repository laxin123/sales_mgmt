from django import forms
from django.forms import inlineformset_factory
from . models import Product,DailyTransaction,Daily, InventoryProduct,Purchase,Sales, PurchaseItem,Expenses,ProductUnit,Payment, Customer, Seller,SalesItem
from account.models import User


class UserForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)
    password2 = forms.CharField(widget=forms.PasswordInput, label='Confirm Password')
    class Meta:
        model = User
        fields = ['fullname','email','phone_No','address','image','password','password2']

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get('password')
        password2 = cleaned_data.get('password2')

        if password and password2 and password != password2:
            raise forms.ValidationError("Passwords do not match")

        return cleaned_data


class CustomerForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields ='__all__'


class SellerForm(forms.ModelForm):
    class Meta:
        model = Seller
        fields= '__all__'

class ProductUnitForm(forms.ModelForm):
    class Meta:
        model  = ProductUnit
        fields ='__all__'


class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields ='__all__'


class InventoryProductForm(forms.ModelForm):
    class Meta:
        model = InventoryProduct
        fields ='__all__'


class PurchaseForm(forms.ModelForm):
    fieldsets = [
        ("Purchase Information", {'fields': [
            ('party', 'total_amount','bill_no'),
        ]})
    ]

    class Meta:
        model = Purchase
        fields = '__all__'

class PurchaseItemForm(forms.ModelForm):
    class Meta:
        model = PurchaseItem
        fields = ['product', 'unit', 'amount_per_unit', 'quantity']

PurchaseItemFormSet = inlineformset_factory(
   Purchase,  PurchaseItem,form=PurchaseItemForm,extra=1,can_delete=True,can_delete_extra=True
)
    
# class PurchaseForm(forms.ModelForm):
#     class Meta:
#         model = Purchase
#         fields = ['party', 'total_amount', 'bill_no']

# class PurchaseItemForm(forms.ModelForm):
#     class Meta:
#         model = PurchaseItem
#         fields = ['product', 'unit', 'amount_per_unit', 'quantity', 'expired_date']

class SalesForm(forms.ModelForm):
    class Meta:
        model = Sales
        fields ='__all__'



class ExpensesForm(forms.ModelForm):
    class Meta:
        model =Expenses
        fields =['expenses_name','amount']
    
class PaymentForm(forms.ModelForm):
    class Meta:
        model  = Payment
        fields ='__all__'


class DailyForm(forms.ModelForm):
    class Meta:
        model =Daily
        fields ='__all__'

class DailyTransactionForm(forms.ModelForm):
    class Meta:
        model = DailyTransaction
        fields =['product','quantity','unite','remarks']

class Product_EditForm(forms.ModelForm):
    class Meta:
        model = SalesItem
        fields = ['product', 'price', 'quantity']