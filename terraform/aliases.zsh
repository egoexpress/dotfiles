alias terragrunt-plan-all="terragrunt run-all plan -var-file=$(pwd)/variables.tfvars --terragrunt-exclude-dir=. --compact-warnings --terragrunt-non-interactive"
alias terragrunt-apply-all="terragrunt run-all apply -var-file=$(pwd)/variables.tfvars --terragrunt-exclude-dir=. --compact-warnings --terragrunt-non-interactive"
