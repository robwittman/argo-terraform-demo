resource "random_string" "suffix" {
  count = 8
  length = 16
}
