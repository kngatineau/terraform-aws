locals {
  iam_users = {
    "kaitlyn" = {
      name = "kaitlyn"
      path = "/kaitlyn/"
    },
    // indie is my cat. she's the admin to my heart.
    "indie"   = {
      name = "indie"
      path = "/indie/"
    },
    // ... add more users here
  }
}

# this is a super dangerous policy; don't use it in a production environment
# TODO - make this less dangerous by refining actions and resources
data "aws_iam_policy_document" "admin_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
    effect    = "Allow"
  }
}

resource "aws_iam_group" "admin" {
  name = "admin"
  path = "/users/"
}

resource "aws_iam_group_policy" "admin_policy" {
  name   = "admin_policy"
  group  = aws_iam_group.admin.name
  policy = data.aws_iam_policy_document.admin_policy.json
}

module "admin_user" {
  source     = "../modules"
  for_each   = local.iam_users
  user_name  = each.value.name
  user_path  = each.value.path
  group_name = aws_iam_group.admin.name
}
