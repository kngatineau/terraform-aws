variable user_name {
  type        = string
  description = "Name of user (required)"
}

variable user_path {
  type        = string
  description = "Path assigned to user"
}

variable group_name {
  type        = string
  description = "Name of group (required)"
}

resource aws_iam_user "iam_user" {
  name = var.user_name
  path = var.user_path
}

resource aws_iam_user_group_membership "admin_group_membership" {
  user = var.user_name
  groups = [ 
    var.group_name
  ]
}
