def test_main_package_is_installed(host):
    package = host.package("tcg")
    assert package.is_installed


def test_main_service_running_and_enabled(host):
    service = host.service("tcg")
    assert service.is_running
    assert service.is_enabled


def test_main_service_listen_8084_tcp(host):
    service = host.socket("tcp://0.0.0.0:8084")
    assert service.is_listening
