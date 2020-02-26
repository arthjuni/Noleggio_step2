from django.shortcuts import render,get_object_or_404
from .models import VIDEO
#from django.http import HttpResponseRedirect
#from NEGOZIO.form import nameform
# Create your views here.
def NegozioHome(pg):
	list_film=VIDEO.objects.all();

	return render(pg,'Pages/NegozioHome.html',{'list_video':list_film})
	
def AccessNegozio(pge):
	#code per gestire l'accesso al contenuto forsando 
	# la connexion ou la registrazione 
	
	return render(pge,'Pages/NegozioAccess.html')
	
def test(pge):
	return render(pge,'Pages/test.html')

def FilmDetaglio(pg,ID):#la fontion che gestice la vista del detaglio del film
	
	sel=VIDEO.objects.filter(pk=ID)
	return render (pg,'Layouts/Dettaglio_Film.html',{'ttl':sel})





	
def get_name(reception):
	
	return render(reception,'Pages/test')