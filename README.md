# Module Expansion and Variable Validation Demos

This repository includes small demos demonstrating module expansion
(using module `for_each`) and variable validation, features that
are available in the 0.13 major release of Terraform.

## Module Expansion

Module expansion in Terraform encompasses using the `count` or `for_each` 
keywords in a module call block:

```terraform
module "foo" {
    source = "./mymodule"
    count  = 2
}
```

It is called module expansion because one module may _expand_ to multiple
module _instances_.

## Module `depends_on`

Dependencies between modules are represented in Terraform in the construction
of the graph between dependencies. However, there are cases where nothing in the
configuration demonstrates the dependency between modules, and in this
scenario, you can use `depends_on`:

```terraform
module "a" {
  source = "./a"
}

module "b" {
  source = "./b"
  depends_on = [module.a]
}
```

This example in this repo is based of that of Roger Berlind's [excellent article](https://medium.com/hashicorp-engineering/creating-module-dependencies-in-terraform-0-13-4322702dac4a).

## Variable Validation

Variable validation is no longer experimental as of 0.13! Validate variables, providing
a condition and an error message, that are inputs to your module.

```terraform
variable "my_var" {
  type        = string

  validation {
    condition     = can(regex("^[a-z]*$", var.myvar))
    error_message = "Only lowercase letters are allowed"
  }
}
```
