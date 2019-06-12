#
# Specify a public SSH key to use for connecting to instances.
#
resource "aws_key_pair" "jahio" {
  key_name   = "jahio"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDekjS8N+X+xhPDs8sE9071H2cKLztwQYBz/BD08skGy9sFsXmZvB4HdVWZzx/JtJwX2U+0qr7Tm63Mj2ox9csJ1yKm+Yf1U+HUoXM8KWpdjYxH7kiF/aHrhlKLKxculWjLWfOlPQt5HOREYYpiUe1fjKIhWNm3+oEhBjc6jmqxv9ccQ7d+cPOxZasz9s8cWGB916AeP5Vzsz46Jl3tHu5/5pHTJVZfLlljpGSWjVMs7Z+9uQ0KFhsWVrzTejnHy7YYRVzzpYOsOqc+4NvPQ2DkImxiAoAmpCKBV5PL7jl4Mvc+GXSvkodnOWwAOJUAVfPgNnzOoLL4Gov415edfO7TlOLbQFWTBzDEF8EFYLs2atnt5q7i7pgAKSnhy1Q5Vs+H2trr5vrkIV6SBFaNX3iwKZJkrEcXsNRM9cCAuTTJ+tEkq2hXOMiJG8D70C5Reo7Qe1CAErrFa/EfDSR8T0PuqUccpts9JG7Nv85hgZ66gh9ppJ6hPYuYQX3j390MmH2TgfkV9Xw2pozqye52wqzPiKnA6l3KaO/CqlCfWM5epqHrhbjx/sNvXkOXMTe+UdYN+lzV1GkgfLO9VtJlkMCXuVaIotiya4F63ef3pijdJH+TXKw825/UjTb8Q3oeKswLM6viX0PqVDa8uxP1nI4DO6Js0vPiKIkgW1zn9CjejQ== jah@jah.io"
}
