(defn euler-82 []
  (let [mat   (load-matrix "/path/to/matrix.txt")
        m     (count mat)
        n     (count (first mat))
        goal? (fn [e] (= (second e) n))
        cost  (memoize (fn [[i j]] (nth (nth mat (dec i)) (dec j))))
        est   (memoize (fn [[i j]] (+ (- m i) (- n j))))
        neigh (memoize
               (fn [[i j]]
                (merge
                 (when (< i m) {[(inc i) j] (cost [(inc i) j])})
                 (when (< j n) {[i (inc j)] (cost [i (inc j)])})
                 (when (< 1 i) {[(dec i) j] (cost [(dec i) j])}))))]
    (apply
     min
     (for [i (range 1 (inc m))
           start [[i 1]]
           path  [(a*-search est neigh start goal?)]]
       (reduce + (map cost path))))))

(time (euler-82)) ;; "Elapsed time: 8053.744512 msecs"
