/**
 * Create internet gateway with name IGCurso
*/
resource "aws_internet_gateway" "IGCurso" {
  vpc_id = aws_vpc.Curso.id
  depends_on = [aws_vpc.Curso]
  tags = {
    Name = "IGCurso"
  }
}