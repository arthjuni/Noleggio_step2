#from django.contrib import admin
from django.urls import path, re_path
from . import views

urlpatterns = [
    #path('admin/', admin.site.urls),
	re_path(r'^NegozioHome$',views.NegozioHome),
	re_path(r'^NegozioAccess',views.AccessNegozio, name='NegozioAccess'),
	#re_path(r'^Access',views.ACCESSO, name='Access'),
	re_path(r'^test',views.get_name),
	re_path(r'^detail/(?P<ID>\d+)$',views.FilmDetaglio,name='detaglio'),
]
