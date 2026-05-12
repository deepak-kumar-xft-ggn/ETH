{#
	One-time codegen utility — YAML has been generated and added to models/schema.yml.
	Commented out to avoid a compile-time dependency on stablecoin_activity_per_day
	when it is not in the selected graph (e.g. during CI slim builds).

	{{ codegen.generate_model_yaml(['stablecoin_activity_per_day']) }}
#}