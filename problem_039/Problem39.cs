using System;
using System.Diagnostics;
using System.Collections.Generic;
using System.Collections;


namespace euler {
    class Problem39 {
        
        public static void Main(string[] args) {
            new Problem39().BruteForce();
            new Problem39().NumberTheory();
            new Problem39().Arithmetic();
        }

        public void BruteForce() {
            Stopwatch clock = Stopwatch.StartNew();

            int[] p = new int[1001];
            int result = 0;

            for (int a = 1; a < 999; a++) {
                for (int b = 1; b + a < 1000; b++) {
                    for (int c = 1; c+b+a < 1001; c++) {
                        if (a * a + b * b == c * c) {
                            p[a + b + c]++;
                        }
                    }                    
                }                
            }

            for (int i = 1; i < p.Length; i++) {
                if (p[i] > p[result]) {
                    result = i;
                }
            }


            clock.Stop();
            Console.WriteLine("The number of solutions is maximized for p={0} resulting in {1} solutions", result, p[result]);
            Console.WriteLine("Solution took {0} ms", clock.ElapsedMilliseconds);
        }


        public void NumberTheory() {
            Stopwatch clock = Stopwatch.StartNew();

            int pMax = 0, tMax = 0;           
            int m = 0, k = 0;
            
            for (int s = 1; s <= 1000; s++) {
                int t = 0;
                int mlimit = (int)Math.Sqrt(s / 2);
                for (m = 2; m <= mlimit; m++) {
                    if ((s / 2) % m == 0) { // m found                     
                        if (m % 2 == 0) { // ensure that we find an odd number for k
                            k = m + 1;
                        } else {
                            k = m + 2;
                        }
                        while (k < 2 * m && k <= s / (2 * m)) {
                            if (s / (2 * m) % k == 0 && gcd(k, m) == 1) {
                                t++;
                            }
                            k += 2;
                        }
                    }                    
                }
                if (t > tMax) {
                    tMax = t;
                    pMax = s;
                }
            }


            clock.Stop();
            Console.WriteLine("The number of solutions is maximized for p={0} resulting in {1} solutions", pMax, 2*tMax);
            Console.WriteLine("Solution took {0} ms", clock.ElapsedMilliseconds);
        }


        public int gcd(int a, int b) {
            int y = 0;
            int x = 0;

            if (a > b) {
                x = a;
                y = b;
            } else {
                x = b;
                y = a;
            }

            while (x % y != 0) {
                int temp = x;
                x = y;
                y = temp % x;
            }

            return y;
        }

        public void Arithmetic() {
            Stopwatch clock = Stopwatch.StartNew();

            long result = 0, resultSolutions = 0;
            
            for (long p = 2; p <= 1000; p += 2) {
                int numberOfSolutions = 0;
                for (long a = 2; a < (p/3); a++) {
                    if(p*(p-2*a) % (2*(p-a)) == 0){
                        numberOfSolutions++;
                    }
                }
                if(numberOfSolutions > resultSolutions){
                    resultSolutions = numberOfSolutions;
                    result = p;
                }
            }
            
            clock.Stop();
            Console.WriteLine("The number of solutions is maximized for p={0}", result);
            Console.WriteLine("Solution took {0} ms", clock.ElapsedMilliseconds);
        }

    }
}
