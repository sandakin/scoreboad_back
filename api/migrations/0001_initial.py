# Generated by Django 3.0.1 on 2019-12-21 09:43

from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Game',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=45)),
                ('date', models.DateField()),
                ('location', models.CharField(max_length=100)),
                ('start_time', models.TimeField()),
                ('end_time', models.TimeField()),
            ],
        ),
        migrations.CreateModel(
            name='Player',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=45)),
                ('rank', models.CharField(max_length=20)),
                ('height', models.FloatField()),
                ('dob', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='Team',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=45)),
                ('logo', models.CharField(max_length=45)),
            ],
        ),
        migrations.CreateModel(
            name='Tournament',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('start_date', models.DateTimeField()),
                ('end_date', models.DateTimeField()),
                ('no_of_games', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(2)])),
                ('sponsor', models.CharField(max_length=100)),
                ('description', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='TeamScore',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('total_field_goals', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('success_field_goals', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('total_points', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('success_points', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('total_free_throws', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('success_free_throws', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('rebounds', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('offensive', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('assists', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('blocks', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('steals', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('turnovers', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('points_in_the_paint', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('fouls_personal', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('game', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='team_score', to='api.Game')),
                ('team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='team_score', to='api.Team')),
            ],
        ),
        migrations.CreateModel(
            name='Staff',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='staff', to='api.Team')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='staff', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='PlayerScore',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('minutes_played', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('rebounds', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('assists', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('points', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('game', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='player_score', to='api.Game')),
                ('player', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='player_score', to='api.Player')),
            ],
        ),
        migrations.AddField(
            model_name='player',
            name='team',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='player', to='api.Team'),
        ),
        migrations.AddField(
            model_name='player',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='player', to=settings.AUTH_USER_MODEL),
        ),
        migrations.CreateModel(
            name='GameScore',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('q1', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('q2', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('q3', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('q4', models.IntegerField(validators=[django.core.validators.MaxLengthValidator(3)])),
                ('is_win', models.BooleanField()),
                ('game', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='game_score', to='api.Game')),
                ('team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='game_score', to='api.Team')),
            ],
        ),
        migrations.AddField(
            model_name='game',
            name='tournament',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='games', to='api.Tournament'),
        ),
    ]
