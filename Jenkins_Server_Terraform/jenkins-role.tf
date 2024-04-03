# create iam policy document. this policy allows the jenkins  server to assume a role
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Create the IAM role using the policy document defined in the data source
resource "aws_iam_role" "jenkins_execution_role" {
  name               = "${var.project_name}-${var.environment}-jenkins-execution-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

# Attach the AWS managed policy (AdministratorAccess) to the IAM role

resource "aws_iam_role_policy_attachment" "jenkins_policy_attachment" {
  role       = aws_iam_role.jenkins_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Create an IAM instance profile and associate it with the IAM role
resource "aws_iam_instance_profile" "jenkins_execution_profile" {
  name = "${var.project_name}-${var.environment}-jenkins-execution-profile"
  role = aws_iam_role.jenkins_execution_role.name
}

