/**
 * Cria uma VPC com o nome de Curso
*/
resource "aws_vpc" "Curso" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "Curso"
  }
}

/**
 * Create a Private ACL
 */
resource "aws_network_acl" "AclPrivada" {
    vpc_id = aws_vpc.Curso.id
    subnet_ids = [aws_subnet.CursoPrivada01.id,aws_subnet.CursoPrivada02.id]
    
    depends_on = [aws_subnet.CursoPrivada01,aws_subnet.CursoPrivada02]

     tags = {
      Name = "AclPrivada"
    }
}


/**
 * Create a Public ACL
 */
resource "aws_network_acl" "AclPublica" {
    vpc_id = aws_vpc.Curso.id
    subnet_ids = [aws_subnet.CursoPublica01.id,aws_subnet.CursoPublica02.id]

    depends_on = [aws_subnet.CursoPublica01,aws_subnet.CursoPublica02]

    tags = {
      Name = "AclPublica"
    }
}

/**
* Add Inbound rule on AclPrivate
*/
resource "aws_network_acl_rule" "AclPrivadaInboundRules" {
    
    network_acl_id = aws_network_acl.AclPrivada.id

    protocol   = "all"
    rule_number = 100
    egress = false
    rule_action = "allow"
    cidr_block = "0.0.0.0/0"
    
    depends_on = [aws_network_acl.AclPrivada]
}

/**
* Add Inbound rule on AclPublica
*/
resource "aws_network_acl_rule" "AclPublicaInboundRules" {
    
    network_acl_id = aws_network_acl.AclPublica.id
    
    protocol   = "all"
    rule_number = 100
    egress = false
    rule_action = "allow"
    cidr_block = "0.0.0.0/0"
     
    depends_on = [aws_network_acl.AclPublica]
}

/**
* Add Outbound rule on AclPrivate
*/
resource "aws_network_acl_rule" "AclPrivadaOutboundRules" {
    
    network_acl_id = aws_network_acl.AclPrivada.id

    protocol   = "all"
    rule_number = 100
    egress = true
    rule_action = "allow"
    cidr_block = "0.0.0.0/0"
    
    depends_on = [aws_network_acl.AclPrivada]
}

/**
* Add Outbound rule on AclPublica
*/
resource "aws_network_acl_rule" "AclPublicaOutboundRules" {
    
    network_acl_id = aws_network_acl.AclPublica.id
    
    protocol   = "all"
    rule_number = 100
    egress = true
    rule_action = "allow"
    cidr_block = "0.0.0.0/0"
     
    depends_on = [aws_network_acl.AclPublica]
}