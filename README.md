# python-ldapdb slows down django tests significantly

reproduce this behaviour using docker and docker-compose by running

```
$ docker-compose build
[...]
$ docker-compose run web python manage.py test
Creating test database for alias 'default'...
....
----------------------------------------------------------------------
Ran 4 tests in 0.153s

OK
Destroying test database for alias 'default'...
$ docker-compose run web python manage.py test --settings mysite.fast_tests
Creating test database for alias 'default'...
....
----------------------------------------------------------------------
Ran 4 tests in 0.002s

OK
Destroying test database for alias 'default'...
```

`fast_tests` removes the `ldapdb.backends.ldap` database backend, which makes tests significantly faster.

Notes:
  * there is not a single code or tests which is acually using python-ldapdb
  * speed slows down liniar with the number of tests, so slow down is not because of initial test overhead