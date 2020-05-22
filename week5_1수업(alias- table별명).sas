/*지금까지는 column 별명을 바꿀 때 alias를 사용했었는데,,*/
/*2 cases when using a table alias*/

/*a self-join (a table is joines to itself)*/
from airline.staffmaster as s1
		, airline.staffmaster as s2


/*when referencing same named column from same named table fromr difference libraries*/
from airline.flightdelays as ad
		, work.flightdelays as wd
where ad.delay > wd.delay
