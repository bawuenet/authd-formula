=============
authd-formula
=============

A saltstack formula for authd. Authd is a simple RFC 1413 ident protocol
daemon that is commonly available for the Red Hat family of operating
systems.

The upstream project for authd is at <https://github.com/InfrastructureServices/authd>.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``authd``
------------

Installs the authd package and starts the associated systemd socket service.

``authd.package``
------------

Installs the authd package.

``authd.service``
------------

Ensures the service is running.

``authd.config``
------------

Configures the service by using a systemd override file to reconfigure the ExecStart parameter.

``authd.remove``
------------

Stop the service, remove the authd package.
