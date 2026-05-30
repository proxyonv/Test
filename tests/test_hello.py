import pytest
from hello import hello


def test_hello_default():
    assert hello() == "Hello, World!"


def test_hello_custom_name():
    assert hello("Remote Test") == "Hello, Remote Test!"


def test_hello_empty_string():
    assert hello("") == "Hello, !"


@pytest.mark.parametrize(
    "name,expected",
    [
        ("Alice", "Hello, Alice!"),
        ("Bob", "Hello, Bob!"),
        ("Claude", "Hello, Claude!"),
        ("123", "Hello, 123!"),
        ("café", "Hello, café!"),
    ],
)
def test_hello_parametrize(name, expected):
    assert hello(name) == expected


def test_hello_returns_string():
    assert isinstance(hello(), str)
    assert isinstance(hello("test"), str)


def test_hello_whitespace():
    assert hello("  ") == "Hello,   !"


def test_hello_special_characters():
    assert hello("O'Brien") == "Hello, O'Brien!"
    assert hello("<script>") == "Hello, <script>!"
