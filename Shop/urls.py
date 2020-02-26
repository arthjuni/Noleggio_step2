

from django.urls import path,re_path,include
from . import views

urlpatterns = [

    re_path(r'^Accesso$', views.accesso, name='ACCESSO'),
    #re_path(r'^Hom', views.home, name='shophome'),
    re_path(r'^HOME$', views.List_Film, name='home'),
    re_path(r'^HOMEADMIN$', views.List_Film_admin, name='adminhome'),
    re_path(r'^FilmNew', views.List_FilmNew, name='new'),
    re_path(r'^Caricacatalogo', views.Carica_Video, name='caricacatalogo'),
    re_path(r'^Scaricacatalogo', views.Scarica_Video, name='scaricacatalogo'),
    re_path(r'^Caricaarticolo', views.Carica_Articolo, name='caricaarticolo'),
    re_path(r'^Scaricaarticolo', views.Scarica_Articolo, name='scaricaarticolo'),
    re_path(r'^Caricamerce', views.Carica_Merce, name='caricamerce'),
    re_path(r'^Scaricamerce', views.Scarica_Merce, name='scaricamerce'),
    re_path(r'^Logout', views.Logout, name='logout'),
    re_path(r'^FilmAction', views.List_FilmAction, name='action'),
    re_path(r'^FilmHorror', views.List_FilmHorror, name='orror'),
    re_path(r'^FilmSports', views.List_FilmSports, name='sports'),
    re_path(r'^FilmAnimation', views.List_FilmAnimation, name='animation'),
    re_path(r'^FilmClassics', views.List_FilmClassics, name='classics'),
    re_path(r'^FilmComedy', views.List_FilmComedy, name='comedy'),
    re_path(r'^FilmDocumentary', views.List_FilmDocumentary, name='documentary'),
    re_path(r'^FilmDrama', views.List_FilmDrama, name='drama'),
    re_path(r'^FilmFamily', views.List_FilmFamily, name='family'),
    re_path(r'^FilmForeign', views.List_FilmForeign, name='foreign'),
    re_path(r'^FilmGames', views.List_FilmGames, name='games'),
    re_path(r'^FilmTravel', views.List_FilmTravel, name='travel'),
    re_path(r'^detail/(?P<ID>\d+)$', views.FilmDetaglio, name='detaglio'),
    re_path(r'^Search', views.search, name='search'),
    re_path(r'^Inscription$', views.Inscription, name='inscription'),
    re_path(r'^Grazie', views.grazie, name='grazie'),

]

