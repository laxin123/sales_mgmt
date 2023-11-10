from django import template
from app.models import Customer,Sales,Toll,DailyTransaction
from django.db.models import Min,Max,Sum
from django.contrib import sessions
register = template.Library()

@register.filter
def multiply(value, arg):
    return value * arg


# @register.filter
# def toll_related_total(id):
#     total_amount = 0.0
#     toll = Toll.objects.get(id=id)
#     customers = Customer.objects.filter(toll=toll)
#     for item in customers.


@register.filter
def total_sales_for_nepali_date(nepali_create_date):
    total_amount_for_date = Sales.objects.filter(nepali_create_date=nepali_create_date).aggregate(total=Sum('total_amount'))['total']
    return total_amount_for_date

@register.filter
def total_debit_amount(nepali_create_date):
    total_debit = Sales.objects.filter(nepali_create_date=nepali_create_date).aggregate(total=Sum('paid_amount'))['total']
    return total_debit


@register.filter
def total_credite_amount(nepali_create_date):
    total_credite = Sales.objects.filter(nepali_create_date=nepali_create_date).aggregate(total=Sum('remaining_amount'))['total']
    return total_credite

@register.filter
def customercount(toll):
    toll = Toll.objects.get(toll_slug= toll)
    customers = toll.customer_toll.all().count()
    return customers

# @register.filter(name='english_to_nepali_date')
# def english_to_nepali_date(value):
#     try:
#         english_date = value.strftime('%Y-%m-%d')
#         nepali_date_obj = convert_ad_to_bs(english_date)
#         return nepali_date_obj
#     except Exception as e:
#         return str(e)


@register.filter
def total_debit(values):
    if isinstance(values, float):
        return values
    try:
        total = sum(float(value) for value in values)
        return total
    except (ValueError, TypeError):return 0  


@register.filter
def get_lowest_date(user):
    queryset = Customer.objects.get(customer=user, nepali_create_date__isnull=False)
    lowest_date = queryset.aggregate(Min('nepali_create_date'))['nepali_create_date__min']
    return lowest_date

@register.filter
def get_highest_date(user):
    queryset = Customer.objects.get(customer=user, nepali_create_date__isnull=False)
    highest_date = queryset.aggregate(Max('nepali_create_date'))['nepali_create_date__max']
    return highest_date

@register.filter(name='calculate_total')
def calculate_total(items, sales):
    running_total = 0
    for item in sales:
        if item.payment_status == "paid" or item.payment_status == "partially_paid":
            running_total -= item.paid_amount
        else:
            running_total += item.remaining_amount

        item.running_total = running_total  
       
    return items



@register.filter
def calculate_total_daily(items, date):
    total = DailyTransaction.objects.filter(dailyid__nepali_date=date).aggregate(total=Sum('total_amount'))['total']
    return total



from datetime import date

def convert_nepali_date(value):
    # Split the Nepali date into components
    day, month, year = value.split('-')

    # Convert Nepali month name to its numeric representation (you might need a dictionary for this)
    # For example, 'Kartik' -> 7

    # Create a date object using the converted components
    nepali_date = date(int(year), int(month), int(day))

    # Format the date in the desired format
    formatted_date = nepali_date.strftime("%d-%m-%Y")

    return formatted_date

register.filter('convert_nepali_date', convert_nepali_date)

@register.filter
def nepali_price_format(value):
    try:
        value = str(value)

        # Split the number into parts before and after the decimal point
        parts = value.split('.')

        # Format the part before the decimal point
        integer_part = parts[0]
        integer_part = "{:,}".format(int(integer_part)).replace(',', ',')

        # If the integer part has more than 3 digits, add commas every two digits from the right
        if len(integer_part) > 3:
            integer_part = ','.join([integer_part[-2*i-2: -2*i] for i in range(len(integer_part)//2)][::-1]) + integer_part[-2*(len(integer_part)//2):]

        # If there is a decimal part, combine both parts
        if len(parts) > 1:
            value = integer_part + '.' + parts[1]
        else:
            value = integer_part

        return value
    except:
        return value


import decimal
@register.filter
def nepalicurrencyFormat(n):
    if isinstance(n, str) and n.endswith('.0'):
        n = n[:-3]  # Remove the '.00' from the end of the string

    d = decimal.Decimal(str(n))
    if d.as_tuple().exponent < -2:
        s = str(n)
    else:
        s = '{0:.2f}'.format(n)
    
    l = len(s)
    i = l-1
    res = ''
    flag = 0
    k = 0

    while i >= 0:
        if flag == 0:
            res = res + s[i]
            if s[i] == '.':
                flag = 1
        elif flag == 1:
            k = k + 1
            res = res + s[i]
            if k == 3 and i - 1 >= 0:
                res = res + ','
                flag = 2
                k = 0
        else:
            k = k + 1
            res = res + s[i]
            if k == 2 and i - 1 >= 0:
                res = res + ','
                flag = 2
                k = 0
        i = i - 1

    return res[::-1]




@register.filter
def remove_decimal(value):
    if isinstance(value, str) and (value.endswith('.00') or value.endswith('.0')):
        return value[:-3]
    return value