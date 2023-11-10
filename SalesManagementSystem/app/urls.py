
from django.urls import path
from . import views

from . views import(ProductViews,InventoryProductView,CustomerDetials)

from django.urls import re_path
from django.conf import settings
from django.views.static import serve
from django.conf.urls.static import static 


app_name ='app'


urlpatterns = [
    path('', views.login, name='login'),
    path('logout', views.userlogout, name='logout'),
    path('index', views.index, name='index'),
    path('products', ProductViews.as_view(), name='products'),
    path('products/edite/<int:id>', ProductViews.as_view(), name='edit_product'),
    path('product/delete', views.productDelete, name='productdelete'),
    path('product/unit', views.productUnit, name='productUnit'),
    path('product/unit/delete', views.deleteProductUnit, name='delete_unit'),

    path('inventory-products', InventoryProductView.as_view(), name='inventoryproduct'),
    path('inventory-products/edite/<int:id>', InventoryProductView.as_view(), name='inventoryproductEdite'),
    path('inventory/edite/<int:id>', views.editeinventory, name="edite"),
    path('inventory-product/delete', views.delete_inventory, name='delete_inventory'),

    path('toll', views.toll, name='tolls'),
    path('toll/edit/<slug:slug>', views.edit_toll, name ='edite_toll'),
    path('toll/details/<slug:slug>', views.toll_related, name="toll_details"),


    path('customers', views.customers,name='customers'),
    path('customer/update', views.updatecustomer, name='updatecustomer'),
    path('customer/delete', views.customerdelet,name='customerdelet'),
    path('supplier/update', views.sellerupdate, name='sellerupdate'),
    path('supplier/delete', views.sellerdelete, name ='sellerdelete'),
    path('customer-details/<slug:name_slug>/', CustomerDetials.as_view(), name='customer_details'),



    path('sales-dashboard', views.salesdashboard, name='sales_dashboard'),
    path('sales/item/delete',views.deletesales, name='deletesales'),
    path('sales-dashboard/details/<slug:date>', views.date_related_sales, name='date_related_sales'),
    path('sales-dashboard/toll/details/<slug:slug>', views.toll_related_sales, name='toll_related_sales'),
    path('sales', views.salesItem, name='salesItem'),
    path('sale/order-list/<int:id>', views.sales_item_list, name='salesList'),
    path('sales/add', views.add_edite_sales, name='addsales'),
    path('sales/add/<int:customerId>', views.add_edite_sales, name='add_inner_sales'),
    path('sales/delete', views.delete_sales, name='delete_sales'),
    path('sales/edite/<int:id>', views.add_edite_sales, name='edite_sale_item'),
    path('sales/add_to_cart', views.add_to_cart, name='add_to_cart'),
    path('sales/delet_cart_item',views.delete_cart_item, name='delete_cart_item'),
    path('sales/edit_salesitem/<int:id>', views.edits_sales, name='sale_edits'),
    path('sales/edit_salesitem/save', views.save_edit_sales, name='sale_edits_save'),

    path('getuser',views.get_user, name='get_user_detail'),
    
    path('purchase/add', views.addpurchase, name='addpurchase'),
    path('purchase/add/<int:id>', views.addpurchase, name='edite_purchase'),
    path('purchase/delete', views.deletePurchase, name='deletePurchase'),


    path('create_purchase', views.createpurchase, name='careate_purchase'),
    path('purchase/details/<int:id>', views.purchaseDetails, name='purchase_details'),

    path('expenses/create', views.expenses, name='expenses'),
    path('expense/delete', views.deleteexpense, name='expeses_delete'),

    path('product/unit',views.addProductUnit, name='addProductUnit'),
    # path('products', views.products,name='products'),  

    path('sales/dashboard', views.sales_Dashboard, name='salesDashboard'),

    path('payment',views.payment, name='payment'),

    path('daily-transaction',views.dailytransaction, name='daily_transaction'),
    path('daily', views.daily,name='daily'),
    path('daily-transaction/filter', views.dailytrasactionfilter, name='daily_tran_filter'),
    path('daily-transaction/update/<int:id>',views.edite_dailytransaction, name='update_trasancation'),
    path('daily-transaction/delete', views.delete_transaction, name='delete_transaction'),
    path('daily/delete', views.delete_daily_transaction, name="delete_daily_transaction"),
    path('report/', views.report_daily_tranjection, name='report'),

    # user url

    path('user', views.user_add_edite, name='user'),
    path('user/delete', views.deleteUser, name='deleteUser'),
    



    re_path(r"^media/(?P<path>.*)$", serve, {"document_root": settings.MEDIA_ROOT}),
    re_path(r"^static/(?P<path>.*)$", serve, {"document_root": settings.STATIC_ROOT}),


]

