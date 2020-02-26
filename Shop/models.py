from django.db import models
from django.contrib.auth.models import User


class Fornitore(models.Model):
    fornitore_id = models.AutoField(db_column='Fornitore_id', primary_key=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=45)  # Field name made lowercase.
    last_update = models.DateTimeField(db_column='Last_update')  # Field name made lowercase.

    def __str__(self):
        return '{}'.format(self.nome)



class Merce(models.Model):
    merce_id = models.AutoField(db_column='Merce_id', primary_key=True)  # Field name made lowercase.
    quantita = models.IntegerField(db_column='Quantita')  # Field name made lowercase.
    fornitore = models.ForeignKey(Fornitore, models.DO_NOTHING,
                                      db_column='Fornitore_id')  # Field name made lowercase.
    punto_vendita = models.ForeignKey('PuntoVendita', models.DO_NOTHING,
                                          db_column='Punto_vendita_id')  # Field name made lowercase.
    last_update = models.DateTimeField(db_column='Last_update', blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return 'Nome del Fornitore  :{} quantita di merce  :{} e il Negozio : {}'.format(self.fornitore,self.quantita,self.punto_vendita)



class Localita(models.Model):
    localita_id = models.AutoField(db_column='Localita_id', primary_key=True)  # Field name made lowercase.
    nome_localita = models.CharField(db_column='Nome_localita', max_length=45)

    def __str__(self):
        return self.nome_localita


class PuntoVendita(models.Model):
    punto_vendita_id = models.AutoField(db_column='Punto_vendita_id', primary_key=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=45)  # Field name made lowercase.
    last_update = models.DateTimeField(db_column='Last_update')  # Field name made lowercase.
    localita = models.ForeignKey(Localita, models.DO_NOTHING, db_column='Localita_id')  # Field name made lowercase.

    def __str__(self):
        return '{} di {}'.format(self.nome,self.localita)




class Articolo(models.Model):
    video = models.ForeignKey('Video', models.DO_NOTHING, db_column='Video_id')  # Field name made lowercase.
    merce = models.ForeignKey('Merce', models.DO_NOTHING, db_column='Merce_id')  # Field name made lowercase.
    last_update = models.DateTimeField(db_column='Last_update')  # Field name made lowercase.
    articolo_id = models.AutoField(db_column='Articolo_id', primary_key=True)  # Field name made lowercase.
    quantita = models.IntegerField(db_column='Quantita')  # Field name made lowercase.

    def __str__(self):
        return '{} e di questa {} quantita'.format(self.merce,self.quantita)




class Video(models.Model):
    video_id = models.AutoField(db_column='Video_id', primary_key=True)  # Field name made lowercase.
    regista = models.CharField(db_column='Regista', max_length=100, blank=True, null=True)  # Field name made lowercase.
    autore = models.CharField(db_column='Autore', max_length=200, blank=True, null=True)  # Field name made lowercase.
    casaprodutrice = models.CharField(db_column='CasaProdutrice', max_length=45, blank=True, null=True)  # Field name made lowercase.
    durata = models.IntegerField(db_column='Durata', blank=True, null=True)  # Field name made lowercase.
    genere = models.CharField(db_column='Genere', max_length=100, blank=True, null=True)  # Field name made lowercase.
    titolo = models.CharField(db_column='Titolo', max_length=45, blank=True, null=True)  # Field name made lowercase.
    last_update = models.DateTimeField(db_column='Last_update')  # Field name made lowercase.
    prezzo_listino = models.FloatField(db_column='Prezzo_listino')  # Field name made lowercase.
    description = models.CharField(db_column='Description', max_length=500, blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return 'Titolo :{} Genere :{} Description :{}'.format(self.titolo,self.genere,self.description)



class Lavoratore(models.Model):
    lavoratore_id = models.AutoField(db_column='Lavoratore_id', primary_key=True)  # Field name made lowercase.
    matricola = models.CharField(db_column='Matricola', max_length=45, blank=True, null=True)  # Field name made lowercase.
    punto_vendita = models.ForeignKey('PuntoVendita', models.DO_NOTHING, db_column='Punto_vendita_id')  # Field name made lowercase.
    utente = models.OneToOneField(User,on_delete=models.CASCADE)  # Field name made lowercase.
    responsabile = models.OneToOneField('self', models.DO_NOTHING, db_column='Responsabile_id', blank=True, null=True)

    def __str__(self):
        return 'Matricola  :{}  Negozio :{}  Responsabile :{}'.format(self.matricola,self.punto_vendita,self.responsabile)



class Documento(models.Model):
    documento_id = models.AutoField(db_column='Documento_id', primary_key=True)  # Field name made lowercase.
    firma = models.IntegerField(db_column='Firma')  # Field name made lowercase.

    def __str__(self):
        return self.firma





class Cliente(models.Model):
    cliente_id = models.AutoField(db_column='Cliente_id', primary_key=True)  # Field name made lowercase.
    codicefiscale = models.CharField(db_column='Codicefiscale', max_length=45, blank=True, null=True)  # Field name made lowercase.
    data_di_nascita = models.CharField(db_column='Data_di_nascita', max_length=45, blank=True, null=True)  # Field name made lowercase.
    tipo = models.IntegerField(db_column='Tipo', blank=True, null=True)  # Field name made lowercase.
    documento = models.ForeignKey('Documento', models.DO_NOTHING, db_column='Documento_id')  # Field name made lowercase.
    utente = models.OneToOneField(User,on_delete=models.CASCADE)  # Field name made lowercase.
    last_update = models.DateTimeField(db_column='Last_update',)  # Field name made lowercase.
    telefono_casa = models.CharField(db_column='Telefono_casa', max_length=45, blank=True, null=True)  # Field name made lowercase.
    telefono_cellulare = models.CharField(db_column='Telefono_cellulare', max_length=45, blank=True, null=True)

    '''def __str__(self):
        if self.utente.username == None:
            return "ERROR-CUSTOMER NAME IS NULL"
        return self.utente.username'''



class TestataNoleggio(models.Model):
    testata_noleggio_id = models.AutoField(db_column='Testata_noleggio_id', primary_key=True)  # Field name made lowercase.
    prezzo_definitivo = models.CharField(db_column='Prezzo_definitivo', max_length=45)  # Field name made lowercase.
    data_fine = models.DateTimeField(db_column='Data_fine')  # Field name made lowercase.
    ricevuta_noleggio = models.IntegerField(db_column='Ricevuta_noleggio')  # Field name made lowercase.
    ricevuta_fine = models.IntegerField(db_column='Ricevuta_fine')  # Field name made lowercase.
    cliente = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='Cliente_id')  # Field name made lowercase.
    lavoratore = models.ForeignKey(Lavoratore, models.DO_NOTHING, db_column='Lavoratore_id')


class DetailNoleggio(models.Model):
    noleggio_id = models.AutoField(db_column='Noleggio_id', primary_key=True)  # Field name made lowercase.
    last_update = models.DateTimeField(db_column='Last_update')  # Field name made lowercase.
    dataprevista = models.DateTimeField(db_column='DataPrevista')  # Field name made lowercase.
    articolo = models.ForeignKey(Articolo, models.DO_NOTHING, db_column='Articolo_id')  # Field name made lowercase.
    prezzo_effettivo = models.FloatField(db_column='Prezzo_effettivo')  # Field name made lowercase.
    sconto = models.FloatField(db_column='Sconto')  # Field name made lowercase.
    testata_noleggio = models.ForeignKey('TestataNoleggio', models.DO_NOTHING, db_column='Testata_noleggio_id')



class listvideomerce(models.Model):
    listvideomerce_id = models.IntegerField(db_column='Listvideomerce_id', primary_key=True )  # Field name made lowercase.
    quantitam = models.IntegerField(db_column='quantitaM')  # Field name made lowercase.
    punto_vendita_id = models.IntegerField(db_column='Punto_vendita_id')  # Field name made lowercase.
    quantita = models.IntegerField(db_column='Quantita')  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=45)  # Field name made lowercase.
    titolo = models.CharField(db_column='Titolo', max_length=45, blank=True, null=True)  # Field name made lowercase.
    quantita_articolo = models.IntegerField(db_column='Quantita_articolo')  # Field name made lowercase.
    autore = models.CharField(db_column='Autore', max_length=200, blank=True, null=True)  # Field name made lowercase.
    casaprodutrice = models.CharField(db_column='CasaProdutrice', max_length=45, blank=True, null=True)  # Field name made lowercase.
    description = models.CharField(db_column='Description', max_length=500, blank=True, null=True)  # Field name made lowercase.
    durata = models.IntegerField(db_column='Durata', blank=True, null=True)  # Field name made lowercase.
    genere = models.CharField(db_column='Genere', max_length=100, blank=True, null=True)  # Field name made lowercase.
    regista = models.CharField(db_column='Regista', max_length=100, blank=True, null=True)  # Field name made lowercase.
    prezzo_listino = models.FloatField(db_column='Prezzo_listino')  # Field name made lowercase.
    username = models.CharField(max_length=150)




class Listvideomercelav(models.Model):
    listvideomercelav_id = models.IntegerField(db_column='Listvideomercelav_id', primary_key=True )
    nome = models.CharField(db_column='Nome', max_length=45)  # Field name made lowercase.
    nome_localita = models.CharField(db_column='Nome_localita', max_length=45, blank=True, null=True)  # Field name made lowercase.
    autore = models.CharField(db_column='Autore', max_length=200, blank=True, null=True)  # Field name made lowercase.
    casaprodutrice = models.CharField(db_column='CasaProdutrice', max_length=45, blank=True, null=True)  # Field name made lowercase.
    description = models.CharField(db_column='Description', max_length=500, blank=True, null=True)  # Field name made lowercase.
    durata = models.IntegerField(db_column='Durata', blank=True, null=True)  # Field name made lowercase.
    genere = models.CharField(db_column='Genere', max_length=100, blank=True, null=True)  # Field name made lowercase.
    regista = models.CharField(db_column='Regista', max_length=100, blank=True, null=True)  # Field name made lowercase.
    username = models.CharField(max_length=150, blank=True, null=True)
    prezzo_listino = models.FloatField(db_column='Prezzo_listino', blank=True, null=True)  # Field name made lowercase.
    quantita_merce = models.IntegerField(blank=True, null=True)
    quantita_articolo = models.IntegerField(blank=True, null=True)
    nome_fornitura = models.CharField(db_column='Nome_fornitura', max_length=45, blank=True, null=True)  # Field name made lowercase.
    titolo = models.CharField(db_column='Titolo', max_length=45, blank=True, null=True)  # Field name made lowercase.


class Videoaction(models.Model):
   pass


class Videoanimation(models.Model):
    pass


class Videoclassics(models.Model):
    pass


class Videocomedy(models.Model):
    pass


class Videodocumentary(models.Model):
    pass

class Videodrama(models.Model):
    pass



class Videofamily(models.Model):
   pass


class Videoforeign(models.Model):
    pass

class Videogames(models.Model):
    pass

class Videohorror(models.Model):
    pass


class VideosciFi(models.Model):
    pass



class Videonew(models.Model):
    pass


class Videosports(models.Model):
    pass


class Videotravel(models.Model):
    pass
# Create your models here.
