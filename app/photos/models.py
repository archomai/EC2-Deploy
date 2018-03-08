from django.db import models
from django.db.models.signals import post_delete, pre_delete
from django.dispatch import receiver


class Photo(models.Model):
    file = models.ImageField(upload_to='photo', blank=True)


# photo모델이 삭제되는 시점의 signal을 이용해서
# 인스턴스가 삭제될 때 file필드의 파일도 삭제하도록

@receiver(post_delete, sender=Photo)
def delete_file_from_s3(sender, instance, **kwargs):
    instance.file.delete(save=False)

