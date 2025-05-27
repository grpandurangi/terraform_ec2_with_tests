(base) grpandurangiai@Gururajs-MacBook-Pro terraform_ec2_with_tests % terraform init
Initializing the backend...
Initializing modules...
- ec2 in modules/ec2
- ec2.kms in modules/kms
- test.tests.functional-tests.create_ec2 in modules/ec2
- test.tests.functional-tests.create_ec2.kms in modules/kms
- test.tests.integrations.setup_tests in testing/setup
- test.tests.integrations.create_ec2 in modules/ec2
- test.tests.integrations.create_ec2.kms in modules/kms
- test.tests.unit-tests.plan_create_ec2 in modules/ec2
- test.tests.unit-tests.plan_create_ec2.kms in modules/kms
- test.tests.unit-tests.create_ec2 in modules/ec2
- test.tests.unit-tests.create_ec2.kms in modules/kms
Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v5.98.0...
- Installed hashicorp/aws v5.98.0 (signed by HashiCorp)
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.


(base) grpandurangiai@Gururajs-MacBook-Pro terraform_ec2_with_tests % terraform test -filter=tests/unit-tests.tftest.hcl
tests/unit-tests.tftest.hcl... in progress
  run "plan_create_ec2"... pass
  run "create_ec2"... pass
tests/unit-tests.tftest.hcl... tearing down
tests/unit-tests.tftest.hcl... pass

Success! 2 passed, 0 failed.
(base) grpandurangiai@Gururajs-MacBook-Pro terraform_ec2_with_tests % 

(base) grpandurangiai@Gururajs-MacBook-Pro terraform_ec2_with_tests % terraform test                                        
tests/a-unit-tests.tftest.hcl... in progress
  run "plan_create_ec2"... pass
  run "create_ec2"... pass
tests/a-unit-tests.tftest.hcl... tearing down
tests/a-unit-tests.tftest.hcl... pass
tests/b-functional-tests.tftest.hcl... in progress
  run "create_ec2"... pass
tests/b-functional-tests.tftest.hcl... tearing down
tests/b-functional-tests.tftest.hcl... pass
tests/c-integrations.tftest.hcl... in progress
  run "setup_tests"... pass
  run "create_ec2"... pass
tests/c-integrations.tftest.hcl... tearing down
tests/c-integrations.tftest.hcl... pass

Success! 5 passed, 0 failed.
(base) grpandurangiai@Gururajs-MacBook-Pro terraform_ec2_with_tests % 
