%.stl: %.scad
	openscad -o $@ $<
clean:
	rm *.stl
