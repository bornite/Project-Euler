for i in 00{1..9} 0{10..50}
do
	echo "--- ${i} ---"
	cd ${i} && rspec spec/${i}_spec.rb
	cd ..
done
