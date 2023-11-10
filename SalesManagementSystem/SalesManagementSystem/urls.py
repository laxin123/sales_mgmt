from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('app.urls'))
]+ static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)

handler404 = "app.views.custom_404_view"
handler500 = 'app.views.custom_500_error_view'