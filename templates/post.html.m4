m4_divert(1) m4_dnl
         <div>
	   <header>
	     <h2 class="entry-title">__TITLE</h2>
	   </header>
	   <article>
	   __BODY
             <footer>
	       <p id="meta">
		 m4_ifdef({"__DATE"}, {"Created: __DATE"}, {"m4_dnl"})
		 m4_ifdef({"__UPDATE"}, {"Updated: __UPDATE"}, {"m4_dnl"})
		 <br />
		 m4_ifdef({"__TAGS"}, {"Tags: __TAGS"}, {"m4_dnl"})
	       </p>
	     </footer>
	   </article>
	 </div>
