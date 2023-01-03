resource "aws_security_group" "SGWeb" {
  name        = "SGWeb"
  description = "Security group for web app"
  vpc_id      = aws_vpc.Curso.id
}

resource "aws_security_group" "SGWindows" {
  name        = "SGWindows"
  description = "Security group for windows server"
  vpc_id      = aws_vpc.Curso.id
  
  ingress {
    description      = "Libera RDP"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    ipv6_cidr_blocks  = ["::/0"]
  }
}

resource "aws_security_group_rule" "SGHttp" {
  type              = "ingress"
  description       = "Libera Http"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.SGWeb.id
}

resource "aws_security_group_rule" "SGHttps" {
  type              = "ingress"
  description       = "Libera Https"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.SGWeb.id
}

resource "aws_security_group_rule" "SGSsh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["189.78.71.177/32"]
  security_group_id = aws_security_group.SGWeb.id
}