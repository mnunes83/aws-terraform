/**
 * Create a public subnet with name CursoPublica01
 * on AZ us-east-1a
*/
resource "aws_subnet" "CursoPublica01" {
  vpc_id = aws_vpc.Curso.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.1.0/24"
  ipv6_native = false
  depends_on = [aws_vpc.Curso]
  tags = {
    Name = "CursoPublica01"
  }
}

/**
 * Create a second public subnet with name CursoPublica02
 * on AZ us-east-1b
*/
resource "aws_subnet" "CursoPublica02" {
  vpc_id = aws_vpc.Curso.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.2.0/24"
  ipv6_native = false
  depends_on = [aws_vpc.Curso]
  tags = {
    Name = "CursoPublica02"
  }
}

/**
 * Create a private subnet with name CursoPrivada01
 * on AZ us-east-1a
*/
resource "aws_subnet" "CursoPrivada01" {
  vpc_id = aws_vpc.Curso.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.3.0/24"
  ipv6_native = false
  depends_on = [aws_vpc.Curso]
  tags = {
    Name = "CursoPrivada01"
  }
}

/**
 * Create a second private subnet with name CursoPrivada02
 * on AZ us-east-1b
*/
resource "aws_subnet" "CursoPrivada02" {
  vpc_id = aws_vpc.Curso.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.4.0/24"
  ipv6_native = false
  depends_on = [aws_vpc.Curso]
  tags = {
    Name = "CursoPrivada02"
  }
}