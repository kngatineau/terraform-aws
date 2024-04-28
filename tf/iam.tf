# this is a super dangerous policy; don't use it in a production environment
# TODO - make this less dangerous by refining actions and resources
data "aws_iam_policy_document" "admin_policy" {
  statement {
    actions = ["*"]
    resources = ["*"]
    effect = "Allow"
  }
}

resource "aws_iam_group" "admin" {
  name = "admin"
  path = "/users/"
}

resource "aws_iam_group_policy" "admin_policy" {
  name = "admin_policy"
  group = aws_iam_group.admin.name
  policy = data.aws_iam_policy_document.admin_policy.json
}
