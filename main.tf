module "pre_publish" {
source = "./pre_publish_module"
}
module "policy" {
source = "./demo_policy_module"
depends_on = [module.pre_publish]
}
module "publish" {
source = "./publish_module"
depends_on = [module.policy]
}
