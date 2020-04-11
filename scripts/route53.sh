# List hosted zones
aws-vault exec bettercar-prd -- aws route53 list-hosted-zones | jq

# Create hosted zone (change the caller reference when creating a new hosted zone)
aws-vault exec bettercar-prd -- aws route53 create-hosted-zone --name bettercar.cab --caller-reference 2020-02-18-14:59 --hosted-zone-config Comment="Created manually"

# List DNS records
aws-vault exec bettercar-prd -- aws route53 list-resource-record-sets --hosted-zone-id Z2VFYUJHAJ5WAV | jq

# DNS record creation
aws-vault exec bettercar-prd -- aws route53 change-resource-record-sets --hosted-zone-id Z2VFYUJHAJ5WAV --change-batch file://dnscreate.json

# DNS record deletion
aws-vault exec bettercar-prd -- aws route53 change-resource-record-sets --hosted-zone-id Z2VFYUJHAJ5WAV --change-batch file://dnsdelete.json
