from django.http import HttpResponse
from django.shortcuts import redirect
from django.contrib import messages
from functools import wraps

def login_required(view_fun):
    def wrapper_fun(request, *args, **kwargs):
        if request.user.is_authenticated:
            return view_fun(request, *args, **kwargs)
        else:
            messages.warning(request,"Login required...")
            return redirect('app:login')
    return wrapper_fun


def superuser_required(view_func):
    @wraps(view_func)
    def decorator(request, *args, **kwargs):
        if request.user.is_authenticated and request.user.is_superuser:
            return view_func(request, *args, **kwargs)
        else:
            messages.warning(request, "Permission denied. Superuser access required.")
            return redirect('app:login')
    return decorator