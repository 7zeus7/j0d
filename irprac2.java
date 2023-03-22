/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package des;
import java.util.Scanner;
/**
 *
 * @author naikt
 */
public class irprac2 {
    
    int path[][] = new int[10][10];
    double pagerank[] = new double[10];

    public void calc(double totalNodes) {
        double InitialPageRank;
        double OutgoingLinks = 0; /* C(Wi) */
        double DumpingFactor = 0.85; 
        double TempPageRank[] = new double[10];
        int ExternalNodeNumber;
        int InternalNodeNumber;
        int k = 1;
        int ITERATION_STEP = 1;
        InitialPageRank = 1 / totalNodes;
        System.out.println("Total Number of Nodes: " + totalNodes + "Initial PageRank of all Nodes: " + InitialPageRank);
        for (k = 1; k <= totalNodes; k++) {
            this.pagerank[k] = InitialPageRank;
        }
        System.out.println("Initial PageRank values, 0th step");
        for (k = 1; k <= totalNodes; k++) {
            System.out.println("Page Rank of " + k + " is: " + this.pagerank[k]);
        }
        while (ITERATION_STEP <= 2) {
            for (k = 1; k <= totalNodes; k++) {
                TempPageRank[k] = this.pagerank[k];
                this.pagerank[k] = 0;
            }
            for (InternalNodeNumber = 1; InternalNodeNumber <= totalNodes; InternalNodeNumber++) {
                for (ExternalNodeNumber = 1; ExternalNodeNumber <= totalNodes; ExternalNodeNumber++) {
                    if (this.path[ExternalNodeNumber][InternalNodeNumber] == 1) {
                        k = 1;
                        OutgoingLinks = 0;
                        while (k <= totalNodes) {
                            if (this.path[ExternalNodeNumber][k] == 1) {
                                OutgoingLinks = OutgoingLinks + 1;
                            }
                            k = k + 1;
                        }
                        this.pagerank[InternalNodeNumber] += TempPageRank[ExternalNodeNumber] * (1 / OutgoingLinks);
                    }
                }
            }
            System.out.println("After " + ITERATION_STEP + "th step");
            for (k = 1; k <= totalNodes; k++) {
                System.out.println("Page Rank of " + k + "in" + this.pagerank[k]);
                ITERATION_STEP = ITERATION_STEP + 1;
            }

            for (k = 1; k <= totalNodes; k++) {
                this.pagerank[k] = (1 - DumpingFactor) + DumpingFactor * this.pagerank[k];
            }
            System.out.println("Final Page Rank: ");
            for (k = 1; k <= totalNodes; k++) {
                System.out.println("Page Rank of " + k + "is: " + this.pagerank[k]);
            }
        }
    }

    public static void main(String[] args) {
        int nodes, i, j;
        Scanner in = new Scanner(System.in);
        System.out.println("Enter the Number of WebPages");
        nodes = in.nextInt();
        irprac2 p = new irprac2();
        System.out.println("Enter the Adjacency matrix with 1->PATH & 0->NO PATH Be"+"tween two Webpages:");
        for(i=1;i<=nodes;i++){
            for (j=1;j<=nodes;j++){
                p.path[i][j]=in.nextInt();
                if(j==1){
                    p.path[i][j]=0;
                }
            }
            p.calc(nodes);
        }

}

}
