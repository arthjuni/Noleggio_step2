from django.db import models

# Create your models here.

#from django.db import models

# Create your models here.



class LAVORATORE(models.Model):
    Nome=models.CharField(max_length=200)
    Cognome=models.CharField(max_length=200)
    Matricola=models.CharField(max_length=200)
    
    
   
 
class ADDETTI(models.Model):
    Lavorator_fk=models.ForeignKey(LAVORATORE,on_delete=models.CASCADE)
    
class RESPONSABILE(models.Model):
    LAVORATORE_fk=models.ForeignKey(LAVORATORE,on_delete=models.CASCADE) 
    

class ACCESSO(models.Model):
    Utente=models.CharField(max_length=200)
    Password=models.CharField(max_length=100)
    Mail=models.EmailField(max_length=50)
    Lavoratore_id=models.OneToOneField(LAVORATORE, on_delete=models.CASCADE)
     

    


    
class VIDEO(models.Model):
    Regista=models.CharField(max_length=200)
    Autore=models.CharField(max_length=200)
    CasaProdutrice=models.CharField(max_length=200)
    Durata=models.DurationField()
    Picture=models.URLField(null=True)
    Genere=models.CharField(max_length=100)
    Titolo=models.CharField(max_length=200)
    

class FORNITORE(models.Model):
    pass
    
class MERCE(models.Model):
    #punto_vendita=models.ManyToManyField(PUNTO_VENDITA, related_name='Operazione_merce_puntoV',blank=True)
    #Scarico=models.ManyToManyField(PUNTO_VENDITA, related_name='CARICO',blank=True)
    quantita=models.IntegerField(null=True)
    Video=models.ForeignKey(VIDEO,on_delete=models.CASCADE)
    Fornitore=models.ForeignKey(FORNITORE, on_delete=models.CASCADE)
    
class PUNTO_VENDITA(models.Model):
    Nome=models.CharField(max_length=200)
    Indirizzo=models.CharField(max_length=100)
    #Scarico=models.ManyToManyField(MERCE, related_name='CARICO',blank=True)   

class OPERAZIONI(models.Model):
    TypoOperazione=models.BooleanField(default=True,null=True)
    Merce=models.ForeignKey(MERCE, on_delete=models.CASCADE)
    PuntoVendita=models.ForeignKey(PUNTO_VENDITA,on_delete=models.CASCADE)
    DataOperazione=models.DateTimeField(auto_now_add=True)
        
    
class CLIENTE(models.Model):
    CodiceFiscale=models.CharField(max_length=200)
    Nome=models.CharField(max_length=200)
    Cognome=models.CharField(max_length=200)
    Telefono_casa=models.CharField(max_length=200,null=True)
    Telefono_Cellulare=models.CharField(max_length=200,null=True)
    Email=models.EmailField()
    Data_di_Nascita=models.DateTimeField()
    Accesso=models.OneToOneField(ACCESSO,on_delete=models.CASCADE)
    Responsabile=models.ManyToManyField(RESPONSABILE, related_name='SCONTO',blank=True)
    

    
class DOCUMENTO(models.Model):
    Firma=models.URLField(null=True)
    Cliente_id=models.OneToOneField(CLIENTE,on_delete=models.CASCADE)


    


class NOLEGGIO(models.Model):
    DataInizio=models.DateTimeField()
    DataFine=models.DateTimeField(null=True)
    Tariffe=models.IntegerField(null=True)
    Quantita=models.IntegerField(null=True)
    DataPrevista=models.DateTimeField(null=True)
    PuntoVendita=models.ForeignKey(PUNTO_VENDITA, on_delete=models.CASCADE,blank=True)
    Cliente=models.ForeignKey(CLIENTE, on_delete=models.CASCADE,blank=True)