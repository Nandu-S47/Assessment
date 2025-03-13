# Assessment

Summary

This is just an assessment created by some assumption. the goal is here to create resourses as mentioned below Using terraform with reusability (Modules) by maintaining reliability and security standards.

API app hosted on AppService
SQL Azure database
Angular web app hosted on a storage acc, served via CDN
Azure monitor for monitoring
KV for secrets


Authenticate

  Method used to authenticate and deploy resource in Azure:
    SP with secret through Azure CLI:
    az login --service-principal -u "CLIENT_ID" -p "CLIENT_SECRET" --tenant "TENANT_ID"

  Recommended Method to be used or standards follow global:
    Authenticating using a Service Principal with Open ID Connect.

Terraform

  
    
  


  
