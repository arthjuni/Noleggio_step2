from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate,logout,login
from django.contrib.auth.forms import UserChangeForm,User
from django.contrib.auth.models import Group,Permission
from django.contrib.contenttypes.models import ContentType
from django import template


#from NOLEGGIO.View import acc

#from .models import NegozioAccesso,
from .models import Listvideomercelav,listvideomerce,Video,Merce,Articolo,Cliente,Videoaction,Videoanimation,Documento,Videotravel,Videosports,Videonew,Videogames,Videoforeign,Videofamily,Videoclassics,Videocomedy,Videodocumentary,Videodrama,Videoclassics,Videohorror#NegozioCliente,NegozioMerce,VideoMerce,Videoaction,Videofantastic,Videoorror,Videoromance
from .forms import NombreVideo,InscriptioClienti,Articolocar,Videocar,Mercecar
from django.core.paginator import Paginator,PageNotAnInteger,EmptyPage
from django.db.models import Q
#from NOLEGGIO.forms import searcheVideo





@login_required()

def home(pg):
    pass

def accesso(pg ):

    form=User()

    if pg.method=='POST':
        form = User(pg.POST)

        if form.is_valid():
            form.save()
            username=form.cleaned_data['username']
            password=form.cleaned_data['password']
            user=authenticate(pg,username=username,password=password)
            login(pg,user)


    context={
        'form':form
    }
    return render(pg,'registration/login.html',context)





def List_Film(pg):
    #pl=acc()
    #Films=listvideomerce.objects.all()
    Films = listvideomerce.objects.filter(Q(username__icontains=pg.user))

    paginator=Paginator(Films,8)
    page=pg.GET.get('page')
    try:
        lsFilms=paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    #sel = NegozioVideo.objects.filter(pk=ID)
    context={
        #'ttl': sel,
        'list_film':lsFilms,
        'nomeutente': pg.user,
       # 'nomeutente': ttt.utent
    }
    return render(pg,'Layouts/ListFilm.html',context)


def Logout(pg):

    logout(pg)

    return redirect('login')#render(pg,'layouts/Logout.html')


def List_Film_admin(pg):
    #Films=listvideomerce.objects.all()
    print(pg.user)
    #pl=acc()
    Films = Listvideomercelav.objects.filter(Q(username__icontains=pg.user))

    paginator=Paginator(Films,8)
    page=pg.GET.get('page')
    try:
        lsFilms=paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    #sel = NegozioVideo.objects.filter(pk=ID)
    context={
        #'ttl': sel,
        'list_film':lsFilms,
        'nomeutente':pg.user,

    }
    return render(pg,'Layouts/ListFilmAdmin.html',context)


def FilmDetaglio(pg, ID):  # la fontion che gestice la vista del detaglio del film

    #Films = NegozioVideo.objects.all()[:8];
    sel = Listvideomercelav.objects.filter(listvideomercelav_id=ID)
    quanti=Listvideomercelav.objects.filter(Q(username__icontains=pg.user))#Listvideomercelav.objects.all()
    forma = NombreVideo()
    invio=pg.POST.get('noleg')
    if invio:
        print('detail du film')

    if pg.method=='POST':
        forma=NombreVideo(pg.POST)
        if pg.is_valid():
            nombre=pg.POST.get('nbr')
            quanti=quanti-nombre
            quanti.save()

    context = {
            'ttl': sel,
            'QuantiM': quanti,
            'forma':forma,
        }
    return render(pg, 'Layouts/Dettaglio_Film.html',context)



def search(dati):#funzione per la gestion della bare di ricerca
    if dati.method=='POST':
        dato=dati.POST['seach']
    # query=dati.GET.get('query')
    #dato = dati.GET.get('seach')
    if not dato:
           albums = listvideomerce.objects.all()
    else:
            albums = listvideomerce.objects.filter(Q(titolo__icontains=dato)|Q(category__icontains=dato)|Q(actors__icontains=dato))
            #albums = NegozioVideo.objects.filter(titolo__icontains=dato)
            if not albums.exists():
                #messages.error(dati,'no result found')
                HttpResponse("il n' y a pas d'information ")
            else:
                context = {
                    # 'title': title,
                    'album': albums,
                    'dato': dato,
                }
                return render(dati, 'Layouts/Search.html', context)
                #HttpResponse("il n' y a pas d'information ")



    context = {
                        #'title': title,
                        'album': albums,
                        'dato': dato,
        }
    return render(dati, 'Layouts/Search.html', context)



def List_FilmAction(pg):
        Films = Videoaction.objects.all();
        paginator = Paginator(Films, 8)
        page = pg.GET.get('page')
        try:
            lsFilms = paginator.page(page)
        except PageNotAnInteger:
            lsFilms = paginator.page(1)
        except EmptyPage:
            lsFilms = paginator.page(paginator.num_pages)
        # sel = NegozioVideo.objects.filter(pk=ID)
        context = {
            # 'ttl': sel,
            'list_film': lsFilms
        }
        return render(pg, 'Layouts/ListFilmAction.html', context)


def List_FilmSports(pg):
    Films = Videosports.objects.all();
    paginator = Paginator(Films, 8)
    page = pg.GET.get('page')
    try:
        lsFilms = paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    # sel = NegozioVideo.objects.filter(pk=ID)
    context = {
        # 'ttl': sel,
        'list_film': lsFilms
    }
    return render(pg, 'Layouts/ListFilmSports.html', context)



def List_FilmHorror(pg):
    Films = Videohorror.objects.all();
    paginator = Paginator(Films, 8)
    page = pg.GET.get('page')
    try:
        lsFilms = paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    # sel = NegozioVideo.objects.filter(pk=ID)
    context = {
        # 'ttl': sel,
        'list_film': lsFilms
    }
    return render(pg, 'Layouts/ListFilmHorror.html', context)






def List_FilmNew(pg):
    Films = Videonew.objects.all();
    paginator = Paginator(Films, 8)
    page = pg.GET.get('page')
    try:
        lsFilms = paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    # sel = NegozioVideo.objects.filter(pk=ID)
    context = {
        # 'ttl': sel,
        'list_film': lsFilms
    }
    return render(pg, 'Layouts/ListFilmNew.html', context)

def List_FilmTravel(pg):
        Films = Videotravel.objects.all();
        paginator = Paginator(Films, 8)
        page = pg.GET.get('page')
        try:
            lsFilms = paginator.page(page)
        except PageNotAnInteger:
            lsFilms = paginator.page(1)
        except EmptyPage:
            lsFilms = paginator.page(paginator.num_pages)
        # sel = NegozioVideo.objects.filter(pk=ID)
        context = {
            # 'ttl': sel,
            'list_film': lsFilms
        }
        return render(pg, 'Layouts/ListFilmTravel.html', context)
    #title="i resultati sono:%s"%query


def List_FilmAnimation(pg):
    Films = Videoanimation.objects.all();
    paginator = Paginator(Films, 8)
    page = pg.GET.get('page')
    try:
        lsFilms = paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    # sel = NegozioVideo.objects.filter(pk=ID)
    context = {
        # 'ttl': sel,
        'list_film': lsFilms
    }
    return render(pg, 'Layouts/ListFilmAnimation.html', context)

def List_FilmClassics(pg):
    Films = Videoclassics.objects.all();
    paginator = Paginator(Films, 8)
    page = pg.GET.get('page')
    try:
        lsFilms = paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    # sel = NegozioVideo.objects.filter(pk=ID)
    context = {
        # 'ttl': sel,
        'list_film': lsFilms
    }
    return render(pg, 'Layouts/ListFilmClassics.html', context)



def List_FilmComedy(pg):
    Films = Videocomedy.objects.all();
    paginator = Paginator(Films, 8)
    page = pg.GET.get('page')
    try:
        lsFilms = paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    # sel = NegozioVideo.objects.filter(pk=ID)
    context = {
        # 'ttl': sel,
        'list_film': lsFilms
    }
    return render(pg, 'Layouts/ListFilmComedy.html', context)



def List_FilmDocumentary(pg):
    Films = Videodocumentary.objects.all();
    paginator = Paginator(Films, 8)
    page = pg.GET.get('page')
    try:
        lsFilms = paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    # sel = NegozioVideo.objects.filter(pk=ID)
    context = {
        # 'ttl': sel,
        'list_film': lsFilms
    }
    return render(pg, 'Layouts/ListFilmDocumentary.html', context)



def List_FilmDrama(pg):
    Films = Videodrama.objects.all();
    paginator = Paginator(Films, 8)
    page = pg.GET.get('page')
    try:
        lsFilms = paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    # sel = NegozioVideo.objects.filter(pk=ID)
    context = {
        # 'ttl': sel,
        'list_film': lsFilms
    }
    return render(pg, 'Layouts/ListFilmDrama.html', context)



def List_FilmFamily(pg):
    Films = Videofamily.objects.all();
    paginator = Paginator(Films, 8)
    page = pg.GET.get('page')
    try:
        lsFilms = paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    # sel = NegozioVideo.objects.filter(pk=ID)
    context = {
        # 'ttl': sel,
        'list_film': lsFilms
    }
    return render(pg, 'Layouts/ListFilmFamily.html', context)


def List_FilmForeign(pg):
    Films = Videoforeign.objects.all();
    paginator = Paginator(Films, 8)
    page = pg.GET.get('page')
    try:
        lsFilms = paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    # sel = NegozioVideo.objects.filter(pk=ID)
    context = {
        # 'ttl': sel,
        'list_film': lsFilms
    }
    return render(pg, 'Layouts/ListFilmForeign.html', context)

def List_FilmGames(pg):
    Films = Videogames.objects.all();
    paginator = Paginator(Films, 8)
    page = pg.GET.get('page')
    try:
        lsFilms = paginator.page(page)
    except PageNotAnInteger:
        lsFilms = paginator.page(1)
    except EmptyPage:
        lsFilms = paginator.page(paginator.num_pages)
    # sel = NegozioVideo.objects.filter(pk=ID)
    context = {
        # 'ttl': sel,
        'list_film': lsFilms
    }
    return render(pg, 'Layouts/ListFilmGames.html', context)


def Inscription(pg):
    forma=InscriptioClienti()
    if pg.method=='POST':
        #homepage=pg.GET.get('home')
        #if homepage:
            #return render(pg,'Pages/AdminH.html')

        valide = pg.POST.get('invio')
        if valide:
            forma = InscriptioClienti(pg.POST)
            if forma.is_valid():
                codicefiscale=pg.POST.get('codicefiscale')#forma.cleaned_data['codicefiscale']
                #nome=pg.POST.get('nome')#forma.cleaned_data['name']
                #cognome=pg.POST.get('cognome')#forma.cleaned_data['cognome']
                data_di_nascita=pg.POST.get('datanascita')#forma.cleaned_data['datanascita']
                tipo=pg.POST.get('tipo')
                documento=pg.POST.get('documanto')
                utente=pg.POST.get('utente')
               # password=pg.POST.get('password')
                last_update=pg.POST.get('last_update')
                telefono_casa=pg.POST.get('telefonofisso')#forma.cleaned_data['telefonofisso']
                telefono_cellulare=pg.POST.get('telefonocellulare')#forma.cleaned_data['telefonocellulare']
               # email=pg.POST.get('email')#forma.cleaned_data['email']
                inscrito=Cliente.objects.filter(codicefiscale=codicefiscale,data_di_nascita=data_di_nascita,tipo=tipo,documento=documento,utente=utente,last_update=last_update, telefono_casa=telefono_casa,
                                                             telefono_cellulare=telefono_cellulare)


                if not inscrito.exists():
                    inscrito = Cliente.objects.create(codicefiscale=codicefiscale,data_di_nascita=data_di_nascita,tipo=tipo,documento=documento,utente=utente,last_update=last_update, telefono_casa=telefono_casa,
                                                             telefono_cellulare=telefono_cellulare)

                    inscrito.save()
                    return render(pg, 'Pages/Grazie.html')
            else:
                return HttpResponse('utente gia esistente')



            #return HttpResponse('utente non creato')
    context = {
        'forma': forma
    }
    return render(pg,'Layouts/Inscription.html',context)


def grazie(pg):
    return render(pg,'Pages/Grazie.html')


def Carica_Video(pg):#caricare un catalogo di film
    prodotto=Videocar()

    prodotto_invio=pg.POST.get('invio')
    prodotto_return=pg.POST.get('return')
    if prodotto_return:
        return redirect('adminhome')

    if pg.method=='POST':
        prodotto=Videocar(pg.POST)
        if prodotto.is_valid():
            if prodotto_invio:
                regista=prodotto.cleaned_data['regista']
                autore=prodotto.cleaned_data['autore']
                casaprodutrice=prodotto.cleaned_data['casaprodutrice']
                durata=prodotto.cleaned_data['durata']
                genere=prodotto.cleaned_data['genere']
                titolo=prodotto.cleaned_data['titolo']
                last_update=prodotto.cleaned_data['last_update']
                prezzo_listino=prodotto.cleaned_data['prezzo_listino']
                description=prodotto.cleaned_data['description']

                prodotto_save=Video.objects.filter(regista=regista,autore=autore,casaprodutrice=casaprodutrice,
                                                   durata=durata,genere=genere,titolo=titolo,last_update=last_update,
                                                   prezzo_listino=prezzo_listino,description=description)
                #return HttpResponse('sfsdfds')
                if not prodotto_save.exists():
                    prodotto_save = Video.objects.create(regista=regista, autore=autore, casaprodutrice=casaprodutrice,
                                                         durata=durata, genere=genere, titolo=titolo,
                                                         last_update=last_update,
                                                         prezzo_listino=prezzo_listino, description=description)



    return render(pg,'Layouts/Carica_Catalogo.html',{'forma':prodotto})


def Carica_Merce(pg):
    prodottoM = Mercecar()

    prodotto_invio = pg.POST.get('invio')
    prodotto_return = pg.POST.get('return')

    if prodotto_return:
        return redirect('adminhome')

    if pg.method == 'POST':
        prodottoM = Mercecar(pg.POST)
        if prodottoM.is_valid():
            if prodotto_invio:
                quantita = prodottoM.cleaned_data['quantita']
                Fornitor = prodottoM.cleaned_data['fornitore']
                punto_vendita = prodottoM.cleaned_data['punto_vendita']
                last_update = prodottoM.cleaned_data['last_update']



                prodotto_save = Merce.objects.filter(quantita=quantita,fornitore=Fornitor,
                                                     punto_vendita=punto_vendita,
                                                     last_update=last_update)


                if not prodotto_save.exists():
                    prodotto_save = Merce.objects.create(quantita=quantita, fornitore=Fornitor,
                                                         punto_vendita=punto_vendita,
                                                         last_update=last_update)

    return render(pg, 'Layouts/Carico_Merce.html', {'forma': prodottoM})



def Carica_Articolo(pg):
    prodotto=Articolocar()

    prodotto_invio = pg.POST.get('invio')
    prodotto_return = pg.POST.get('return')
    if prodotto_return:
        return redirect('adminhome')


    if pg.method=='POST':
        prodotto=Articolocar(pg.POST)
        if prodotto.is_valid():
            if prodotto_invio:
                video=prodotto.cleaned_data['video']
                merce=prodotto.cleaned_data['merce']
                last_update=prodotto.cleaned_data['last_update']
                quantita=prodotto.cleaned_data['quantita']

                prodotto_save=Articolo.objects.filter(video=video,merce=merce,
                                                      last_update=last_update,quantita=quantita)
                if not prodotto_save.exists():
                    prodotto_save = Articolo.objects.create(video=video, merce=merce,
                                                            last_update=last_update, quantita=quantita)



    return render(pg,'Layouts/Carica_articolo.html',{'forma':prodotto})




def Scarica_Articolo(pg):
    prodotto=Articolocar()

    prodotto_invio = pg.POST.get('invio')
    prodotto_return = pg.POST.get('return')
    if prodotto_return:
        return redirect('adminhome')


    if pg.method=='POST':
        prodotto=Articolocar(pg.POST)
        if prodotto.is_valid():
            if prodotto_invio:
                video=prodotto.cleaned_data['video']
                merce=prodotto.cleaned_data['merce']
                last_update=prodotto.cleaned_data['last_update']
                quantita=prodotto.cleaned_data['quantita']

                prodotto_save=Articolo.objects.filter(video=video,merce=merce,
                                                      last_update=last_update,quantita=quantita)
                if not prodotto_save.exists():
                    prodotto_save = Articolo.objects.create(video=video, merce=merce,
                                                            last_update=last_update, quantita=quantita)



    return render(pg,'Layouts/Carica_articolo.html',{'forma':prodotto})





def Scarica_Merce(pg):
    prodottoM = Mercecar()

    prodotto_invio = pg.POST.get('invio')
    prodotto_return = pg.POST.get('return')

    if prodotto_return:
        return redirect('adminhome')

    if pg.method == 'POST':
        prodottoM = Mercecar(pg.POST)
        if prodottoM.is_valid():
            if prodotto_invio:
                quantita = prodottoM.cleaned_data['quantita']
                Fornitor = prodottoM.cleaned_data['fornitore']
                punto_vendita = prodottoM.cleaned_data['punto_vendita']
                last_update = prodottoM.cleaned_data['last_update']



                prodotto_save = Merce.objects.filter(quantita=quantita,fornitore=Fornitor,
                                                     punto_vendita=punto_vendita,
                                                     last_update=last_update)


                if not prodotto_save.exists():
                    prodotto_save = Merce.objects.create(quantita=quantita, fornitore=Fornitor,
                                                         punto_vendita=punto_vendita,
                                                         last_update=last_update)

    return render(pg, 'Layouts/Carico_Merce.html', {'forma': prodottoM})



def Scarica_Video(pg):#caricare un catalogo di film
    prodotto=Videocar()

    prodotto_invio=pg.POST.get('invio')
    prodotto_return=pg.POST.get('return')
    if prodotto_return:
        return redirect('adminhome')

    if pg.method=='POST':
        prodotto=Videocar(pg.POST)
        if prodotto.is_valid():
            if prodotto_invio:
                regista=prodotto.cleaned_data['regista']
                autore=prodotto.cleaned_data['autore']
                casaprodutrice=prodotto.cleaned_data['casaprodutrice']
                durata=prodotto.cleaned_data['durata']
                genere=prodotto.cleaned_data['genere']
                titolo=prodotto.cleaned_data['titolo']
                last_update=prodotto.cleaned_data['last_update']
                prezzo_listino=prodotto.cleaned_data['prezzo_listino']
                description=prodotto.cleaned_data['description']

                prodotto_save=Video.objects.filter(regista=regista,autore=autore,casaprodutrice=casaprodutrice,
                                                   durata=durata,genere=genere,titolo=titolo,last_update=last_update,
                                                   prezzo_listino=prezzo_listino,description=description)
                #return HttpResponse('sfsdfds')
                if not prodotto_save.exists():
                    prodotto_save = Video.objects.create(regista=regista, autore=autore, casaprodutrice=casaprodutrice,
                                                         durata=durata, genere=genere, titolo=titolo,
                                                         last_update=last_update,
                                                         prezzo_listino=prezzo_listino, description=description)



    return render(pg,'Layouts/Carica_Catalogo.html',{'forma':prodotto})


# Create your views here.
