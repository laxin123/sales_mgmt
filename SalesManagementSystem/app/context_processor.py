from . models import *

def calculate(request):
    instances = Sales.objects.all()
    total_amounts = sum(sale.get_remaining_amount() for sale in instances)
    #DailyTransaction
    dailytransaction = DailyTransaction.objects.all()
    
    # total_daily_amount = sum(daily.get_amount() for daily in dailytransaction)

    expenses = Expenses.objects.all()
    purchase = Purchase.objects.all()
    total_purchase = sum(item.get_total_cost() for item in purchase)
    total_expenses=sum(exp.get_cost() for exp in expenses)
    return({
        'total_sales':total_amounts,
        'total_purchase':total_purchase,
        'total_expenses':total_expenses,
        # 'total_daily_amount':total_daily_amount
    })