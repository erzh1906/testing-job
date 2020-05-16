def test_main_package_is_installed(host):
    package = host.package("mysql-community-server")
    assert package.is_installed


def test_main_service_running_and_enabled(host):
    service = host.service("mysqld")
    assert service.is_running
    assert service.is_enabled


def test_main_service_listen_3306_tcp(host):
    service = host.socket("tcp://0.0.0.0:3306")
    assert service.is_listening
