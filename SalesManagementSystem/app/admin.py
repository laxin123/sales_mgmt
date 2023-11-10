from django.contrib import admin
from . models import (Customer,
                      InventoryProduct,
                      Purchase,
                      PurchaseParty,
                      ProductUnit,
                      PurchaseItem,
                      Product,
                      Sales,
                      SalesItem,
                      Seller,
                      Toll,
                      Expenses,
                      Payment,
                      DailyTransaction,Daily
                    )

admin.site.register(Payment)



class DailyTransactionAdmin(admin.TabularInline):
    model =  DailyTransaction

class DailyAdmin(admin.ModelAdmin):
    inlines =[DailyTransactionAdmin]
    list_display =['nepali_date','total']
admin.site.register(Daily,DailyAdmin)

class Tolladmin(admin.ModelAdmin):
    model = Toll
    list_display =['toll_name']
admin.site.register(Toll, Tolladmin)

class ProductUnitAdmin(admin.ModelAdmin):
    model =ProductUnit
    list_display = ['unit_name']
admin.site.register(ProductUnit,ProductUnitAdmin)

class CustomerAdmin(admin.ModelAdmin):
    model = Customer
    list_display =['name','address','phone_number','email','added_date']
admin.site.register(Customer, CustomerAdmin)

class SellerAdmin(admin.ModelAdmin):
    model = Seller
    list_display =['name','address','phone_number','email']
admin.site.register(Seller, SellerAdmin)


class InventoryProductAdmin(admin.ModelAdmin):
    model = InventoryProduct
    list_display =['product_name','rate_retail','rate_wholesale','rate_manu','created_date','modified_date','deleted_date']
admin.site.register(InventoryProduct,InventoryProductAdmin)


# class PurchasePartyAdmin(admin.ModelAdmin):
#     model =PurchaseParty
#     list_display = ['name','pan_no','address','contact_no','created_date','modified_date','deleted_date']
# admin.site.register(PurchaseParty,PurchasePartyAdmin)


class PurchaseItemAdmin(admin.TabularInline):
    model =PurchaseItem


class PurchaseAdmin(admin.ModelAdmin):
    inlines = [PurchaseItemAdmin]
    list_display = ['party','total_amount','bill_no','created_date','nepali_create_date']
admin.site.register(Purchase, PurchaseAdmin)

class ProductAdmin(admin.ModelAdmin):
    model = Product
    list_display =['product_name','image']
admin.site.register(Product, ProductAdmin)

class SalesItemAdmin(admin.TabularInline):
    model = SalesItem


class SalesAdmin(admin.ModelAdmin):
    inlines =[SalesItemAdmin]
    list_display = ['customer','bill_no','total_amount','remaining_amount','paid_amount','created_date','nepali_create_date']
admin.site.register(Sales, SalesAdmin)


class ExpensesAdmin(admin.ModelAdmin):
    model = Expenses
    list_display =['create_date','expenses_name','amount']
admin.site.register(Expenses,ExpensesAdmin)