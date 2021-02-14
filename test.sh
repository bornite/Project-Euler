for i in 001
do
	echo "--- ${i} ---"
	cd ${i} && rspec spec/${i}_spec.rb
done