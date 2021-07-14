for i in 0{51..59}
do
	echo "--- ${i} ---"
	cd ${i} && rspec spec/${i}_spec.rb
	cd ..
done
