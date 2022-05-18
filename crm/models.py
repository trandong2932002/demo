# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Category(models.Model):
    categoryid = models.AutoField(primary_key=True)
    categoryname = models.CharField(max_length=15)
    description = models.TextField(blank=True, null=True)
    picture = models.BinaryField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'category'


class Customer(models.Model):
    custid = models.AutoField(primary_key=True)
    companyname = models.CharField(max_length=40)
    contactname = models.CharField(max_length=30, blank=True, null=True)
    contacttitle = models.CharField(max_length=30, blank=True, null=True)
    address = models.CharField(max_length=60, blank=True, null=True)
    city = models.CharField(max_length=15, blank=True, null=True)
    region = models.CharField(max_length=15, blank=True, null=True)
    postalcode = models.CharField(max_length=10, blank=True, null=True)
    country = models.CharField(max_length=15, blank=True, null=True)
    phone = models.CharField(max_length=24, blank=True, null=True)
    fax = models.CharField(max_length=24, blank=True, null=True)
    email = models.CharField(max_length=40, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'customer'


class Customercustomerdemographic(models.Model):
    customerid = models.IntegerField(primary_key=True)
    customertypeid = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'customercustomerdemographic'
        unique_together = (('customerid', 'customertypeid'),)


class Customercustomerlist(models.Model):
    customerid = models.OneToOneField(Customer, models.DO_NOTHING, db_column='customerid', primary_key=True)
    customerlistid = models.ForeignKey('Customerlist', models.DO_NOTHING, db_column='customerlistid')

    class Meta:
        managed = False
        db_table = 'customercustomerlist'
        unique_together = (('customerid', 'customerlistid'),)


class Customerdemographic(models.Model):
    customertypeid = models.CharField(primary_key=True, max_length=10)
    customerdesc = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'customerdemographic'


class Customeremployee(models.Model):
    empid = models.IntegerField()
    custid = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'customeremployee'


class CustomeremployeeOld(models.Model):
    empid = models.OneToOneField('Employee', models.DO_NOTHING, db_column='empid', primary_key=True)
    custid = models.ForeignKey(Customer, models.DO_NOTHING, db_column='custid')

    class Meta:
        managed = False
        db_table = 'customeremployee_old'
        unique_together = (('empid', 'custid'),)


class Customerlist(models.Model):
    customerlistid = models.CharField(primary_key=True, max_length=10)
    customerlistdesc = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'customerlist'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Employee(models.Model):
    empid = models.AutoField(primary_key=True)
    lastname = models.CharField(max_length=20)
    firstname = models.CharField(max_length=10)
    title = models.CharField(max_length=30, blank=True, null=True)
    titleofcourtesy = models.CharField(max_length=25, blank=True, null=True)
    birthdate = models.DateTimeField(blank=True, null=True)
    hiredate = models.DateTimeField(blank=True, null=True)
    address = models.CharField(max_length=60, blank=True, null=True)
    city = models.CharField(max_length=15, blank=True, null=True)
    region = models.CharField(max_length=15, blank=True, null=True)
    postalcode = models.CharField(max_length=10, blank=True, null=True)
    country = models.CharField(max_length=15, blank=True, null=True)
    phone = models.CharField(max_length=24, blank=True, null=True)
    extension = models.CharField(max_length=4, blank=True, null=True)
    photo = models.BinaryField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    mgrid = models.IntegerField(blank=True, null=True)
    photopath = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'employee'


class Employeeterritory(models.Model):
    employeeid = models.IntegerField(primary_key=True)
    territoryid = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'employeeterritory'
        unique_together = (('employeeid', 'territoryid'),)


class Orderdetail(models.Model):
    orderid = models.IntegerField()
    productid = models.IntegerField()
    unitprice = models.DecimalField(max_digits=10, decimal_places=2)
    qty = models.SmallIntegerField()
    discount = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'orderdetail'


class Product(models.Model):
    productid = models.AutoField(primary_key=True)
    productname = models.CharField(max_length=40)
    supplierid = models.IntegerField(blank=True, null=True)
    categoryid = models.IntegerField(blank=True, null=True)
    quantityperunit = models.CharField(max_length=20, blank=True, null=True)
    unitprice = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    unitsinstock = models.SmallIntegerField(blank=True, null=True)
    unitsonorder = models.SmallIntegerField(blank=True, null=True)
    reorderlevel = models.SmallIntegerField(blank=True, null=True)
    discontinued = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'product'


class Region(models.Model):
    regionid = models.IntegerField(primary_key=True)
    regiondescription = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'region'


class Salesorder(models.Model):
    orderid = models.AutoField(primary_key=True)
    custid = models.CharField(max_length=15, blank=True, null=True)
    empid = models.IntegerField(blank=True, null=True)
    orderdate = models.DateTimeField(blank=True, null=True)
    requireddate = models.DateTimeField(blank=True, null=True)
    shippeddate = models.DateTimeField(blank=True, null=True)
    shipperid = models.IntegerField(blank=True, null=True)
    freight = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    shipname = models.CharField(max_length=40, blank=True, null=True)
    shipaddress = models.CharField(max_length=60, blank=True, null=True)
    shipcity = models.CharField(max_length=15, blank=True, null=True)
    shipregion = models.CharField(max_length=15, blank=True, null=True)
    shippostalcode = models.CharField(max_length=10, blank=True, null=True)
    shipcountry = models.CharField(max_length=15, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'salesorder'


class Shipper(models.Model):
    shipperid = models.AutoField(primary_key=True)
    companyname = models.CharField(max_length=40)
    phone = models.CharField(max_length=44, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'shipper'


class Supplier(models.Model):
    supplierid = models.AutoField(primary_key=True)
    companyname = models.CharField(max_length=40)
    contactname = models.CharField(max_length=30, blank=True, null=True)
    contacttitle = models.CharField(max_length=30, blank=True, null=True)
    address = models.CharField(max_length=60, blank=True, null=True)
    city = models.CharField(max_length=15, blank=True, null=True)
    region = models.CharField(max_length=15, blank=True, null=True)
    postalcode = models.CharField(max_length=10, blank=True, null=True)
    country = models.CharField(max_length=15, blank=True, null=True)
    phone = models.CharField(max_length=24, blank=True, null=True)
    fax = models.CharField(max_length=24, blank=True, null=True)
    homepage = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'supplier'


class Territory(models.Model):
    territoryid = models.CharField(primary_key=True, max_length=20)
    territorydescription = models.CharField(max_length=50)
    regionid = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'territory'
