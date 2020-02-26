# Generated by Django 3.0.3 on 2020-02-23 10:17

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Fornitore',
            fields=[
                ('fornitore_id', models.AutoField(db_column='Fornitore_id', primary_key=True, serialize=False)),
                ('nome', models.CharField(db_column='Nome', max_length=45)),
                ('last_update', models.DateTimeField(db_column='Last_update')),
            ],
        ),
        migrations.CreateModel(
            name='Localita',
            fields=[
                ('localita_id', models.AutoField(db_column='Localita_id', primary_key=True, serialize=False)),
                ('nome_localita', models.CharField(db_column='Nome_localita', max_length=45)),
            ],
        ),
        migrations.CreateModel(
            name='Video',
            fields=[
                ('video_id', models.AutoField(db_column='Video_id', primary_key=True, serialize=False)),
                ('regista', models.CharField(blank=True, db_column='Regista', max_length=100, null=True)),
                ('autore', models.CharField(blank=True, db_column='Autore', max_length=200, null=True)),
                ('casaprodutrice', models.CharField(blank=True, db_column='CasaProdutrice', max_length=45, null=True)),
                ('durata', models.IntegerField(blank=True, db_column='Durata', null=True)),
                ('genere', models.CharField(blank=True, db_column='Genere', max_length=100, null=True)),
                ('titolo', models.CharField(blank=True, db_column='Titolo', max_length=45, null=True)),
                ('last_update', models.DateTimeField(db_column='Last_update')),
                ('prezzo_listino', models.FloatField(db_column='Prezzo_listino')),
                ('description', models.CharField(blank=True, db_column='Description', max_length=500, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='PuntoVendita',
            fields=[
                ('punto_vendita_id', models.AutoField(db_column='Punto_vendita_id', primary_key=True, serialize=False)),
                ('nome', models.CharField(db_column='Nome', max_length=45)),
                ('last_update', models.DateTimeField(db_column='Last_update')),
                ('localita', models.ForeignKey(db_column='Localita_id', on_delete=django.db.models.deletion.DO_NOTHING, to='Shop.Localita')),
            ],
        ),
        migrations.CreateModel(
            name='Merce',
            fields=[
                ('merce_id', models.AutoField(db_column='Merce_id', primary_key=True, serialize=False)),
                ('quantita', models.IntegerField(db_column='Quantita')),
                ('last_update', models.DateTimeField(blank=True, db_column='Last_update', null=True)),
                ('fornitore', models.ForeignKey(db_column='Fornitore_id', on_delete=django.db.models.deletion.DO_NOTHING, to='Shop.Fornitore')),
                ('punto_vendita', models.ForeignKey(db_column='Punto_vendita_id', on_delete=django.db.models.deletion.DO_NOTHING, to='Shop.PuntoVendita')),
            ],
        ),
        migrations.CreateModel(
            name='Articolo',
            fields=[
                ('last_update', models.DateTimeField(db_column='Last_update')),
                ('articolo_id', models.AutoField(db_column='Articolo_id', primary_key=True, serialize=False)),
                ('quantita', models.IntegerField(db_column='Quantita')),
                ('merce', models.ForeignKey(db_column='Merce_id', on_delete=django.db.models.deletion.DO_NOTHING, to='Shop.Merce')),
                ('video', models.ForeignKey(db_column='Video_id', on_delete=django.db.models.deletion.DO_NOTHING, to='Shop.Video')),
            ],
        ),
    ]
