/// @description Insert description here
// You can write your code in this editor


if(hp <= 0)
{
	instance_destroy();
}


// ATTACK

should_throw = floor(random_range(0, 100 + 1));

if((should_throw == 1) && (current_attack_cd >= attack_cd))
{
	instance_create_layer(x, y, "Instances", obj_tangle_throw);
	current_attack_cd = 0;
}

if(current_attack_cd < attack_cd)
{
	current_attack_cd++;
}