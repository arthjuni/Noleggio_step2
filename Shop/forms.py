from django import forms
from django.forms import ModelForm
from django.forms import ModelForm,TextInput,EmailInput,IntegerField,DateTimeInput
#from .models import Customer,Country,City,Address,Store,Staff
from .models import Cliente,Articolo,Merce,Video

class identifation(forms.Form):
	name=forms.CharField()
	pwd=forms.CharField(widget=forms.PasswordInput())


class NombreVideo(forms.Form):
	nbr=forms.IntegerField()

'''
class inscriptionutente(forms.Form):
	codicefiscale=forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))
	adress = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))
	name=forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))
	cognome=forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}),max_length=50)
	datanascita=forms.DateField(widget=forms.DateTimeInput(attrs={'class': 'form-control'}))
	Telefonofisso=forms.IntegerField(widget=forms.TextInput(attrs={'class': 'form-control'}))
	code=forms.IntegerField(widget=forms.TextInput(attrs={'class': 'form-control'}))
	email=forms.EmailField(widget=forms.EmailInput(attrs={'class': 'form-control'}))
	utente = forms.CharField()
	password = forms.CharField(widget=forms.PasswordInput())

'''


class InscriptioClienti(forms.ModelForm):
	class Meta:
		model=Cliente
		fields=[
			
			'codicefiscale',
			'data_di_nascita',
			'tipo',
			'documento',
			'utente',
			'last_update',
			'telefono_casa',
			'telefono_cellulare',
			]

		widgets={
			'codicefiscale':TextInput(attrs={'class': 'form-control'}),
			'nome':TextInput(attrs={'class': 'form-control'}),
			'cognome':TextInput(attrs={'class': 'form-control'}),
			'data_di_nascita':DateTimeInput(attrs={'class': 'form-control'}),
			'tipo':TextInput(attrs={'class': 'form-control'}),

			'utente':TextInput(attrs={'class': 'form-control'}),
			'password':TextInput(attrs={'class': 'form-control'}),
			'last_update':DateTimeInput(attrs={'class': 'form-control'}),
			'telefono_casa':TextInput(attrs={'class': 'form-control'}),
			'telefono_cellulare':TextInput(attrs={'class': 'form-control'}),
			'email':EmailInput(attrs={'class': 'form-control'})
				 }




class Mercecar(forms.ModelForm):
	class Meta:
		model=Merce
		fields=[
			'quantita',
			'fornitore',
			'punto_vendita',
			'last_update'
		]


class Videocar(forms.ModelForm):
	class Meta:
		model=Video
		fields=[
			'regista',
			'autore',
			'casaprodutrice',
			'durata',
			'genere',
			'titolo',
			'last_update',
			'prezzo_listino',
			'description'

		]


class Articolocar(forms.ModelForm):
	class Meta:
		model=Articolo
		fields=[
			'video',
			'merce',
			'last_update',
			'quantita'
		]

