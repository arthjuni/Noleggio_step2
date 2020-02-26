from django.contrib import admin

from .models import Cliente,Lavoratore,Articolo,Video,Merce,PuntoVendita,Localita,Fornitore

admin.site.register(Fornitore)
admin.site.register(Cliente)
admin.site.register(Articolo)
admin.site.register(PuntoVendita)
admin.site.register(Localita)
admin.site.register(Video)
admin.site.register(Merce)

class LavoratoreInline(admin.TabularInline):
    model=Lavoratore
    fieldsets = [
        (None,{'fields':['punto_vendita','utente']})
    ]
    extra = 0



class ClienteInline(admin.TabularInline):
    model=Cliente
    fieldsets = [
        (None,{'fields':['Codeicefiscale','Data_di_nascita','Last_update','Telefono_casa','Telefono_cellulare']})
    ]
    extra = 0

@admin.register(Lavoratore)
class LavoratorAdmin(admin.ModelAdmin):
    inlines = [LavoratoreInline,]



# Register your models here.
