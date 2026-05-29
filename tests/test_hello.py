from hello import hello


def test_hello_default():
    assert hello() == "Hello, World!"


def test_hello_custom_name():
    assert hello("Remote Test") == "Hello, Remote Test!"


def test_hello_empty_string():
    assert hello("") == "Hello, !"
