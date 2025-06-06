resource "azurerm_databricks_workspace" "example" {
  name                = "${var.prefix}-${var.databricksname}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "${lower(var.sku_name)}"

}

data "databricks_node_type" "smallest" {
  depends_on = [ azurerm_databricks_workspace.example ]
  local_disk = true
}

data "databricks_spark_version" "latest_lts" {
  depends_on = [ azurerm_databricks_workspace.example ]
  long_term_support = true
}

resource "databricks_instance_pool" "pool" {
  instance_pool_name = "firstpool"
  min_idle_instances = 0
  max_capacity       = 50
  node_type_id       = data.databricks_node_type.smallest.id
  idle_instance_autotermination_minutes = 20
  
}

resource "databricks_cluster" "shared_autoscaling" {
  depends_on = [ azurerm_databricks_workspace.example, databricks_instance_pool.pool ]
  instance_pool_id         = databricks_instance_pool.pool.id
  cluster_name            = "Shared Autoscaling"
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 20
  autoscale {
    min_workers = 1
    max_workers = 10
  }
  spark_conf = {
    "spark.databricks.io.cache.enabled" = "true"
    "spark.databricks.cluster.profile" = "serverless"
    "spark.databricks.repl.allowedLanguages" = "sql,python,r"
  }
}