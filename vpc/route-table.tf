/**
 * Create route table with name RTCursoPublica
*/
resource "aws_route_table" "RTCursoPublica" {
  vpc_id = aws_vpc.Curso.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGCurso.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id = aws_internet_gateway.IGCurso.id
  }

  depends_on = [aws_internet_gateway.IGCurso]

  tags = {
    Name = "RTCursoPublica"
  }
}

/**
 * Create route table with name RTCursoPrivada
*/
resource "aws_route_table" "RTCursoPrivada" {
  vpc_id = aws_vpc.Curso.id

  depends_on = [aws_vpc.Curso]

  tags = {
    Name = "RTCursoPrivada"
  }
}

/**
 * Add the subnet CursoPrivada01 on route table RTCursoPrivada 
*/
resource "aws_route_table_association" "RTCursoPrivada01" {
  route_table_id  = aws_route_table.RTCursoPrivada.id
  subnet_id = aws_subnet.CursoPrivada01.id
    
  depends_on = [aws_route_table.RTCursoPrivada]
}

/**
 * Add the subnet CursoPrivada02 on route table RTCursoPrivada 
*/
resource "aws_route_table_association" "RTCursoPrivada02" {
  route_table_id  = aws_route_table.RTCursoPrivada.id
  subnet_id = aws_subnet.CursoPrivada02.id
    
  depends_on = [aws_route_table.RTCursoPrivada]
}

/**
 * Add the subnet CursoPublica01 on route table RTCursoPublica 
*/
resource "aws_route_table_association" "RTCursoPublica01" {
  route_table_id  = aws_route_table.RTCursoPublica.id
  subnet_id = aws_subnet.CursoPublica01.id
  
  depends_on = [aws_route_table.RTCursoPublica]
}

/**
 * Add the subnet CursoPublica02 on route table RTCursoPublica 
*/
resource "aws_route_table_association" "RTCursoPublica02" {
  route_table_id  = aws_route_table.RTCursoPublica.id
  subnet_id = aws_subnet.CursoPublica02.id
  
  depends_on = [aws_route_table.RTCursoPublica]
}